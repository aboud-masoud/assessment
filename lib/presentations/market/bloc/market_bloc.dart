import 'dart:async';
import 'dart:convert';

import 'package:exinity_assessment/locator.dart';
import 'package:exinity_assessment/model/restful/symbol_list.dart';
import 'package:exinity_assessment/model/socket/symbol.dart';
import 'package:exinity_assessment/services/symbol_service.dart';
import 'package:exinity_assessment/utils/constants/app_constant.dart';
import 'package:exinity_assessment/utils/constants/connection_constant.dart';
import 'package:exinity_assessment/utils/enum/loading_statuses_enum.dart';
import 'package:exinity_assessment/utils/sockets/web_socket_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'market_event.dart';
part 'market_state.dart';
part 'market_bloc.freezed.dart';

class MarketBloc extends Bloc<MarketEvent, MarketState> {
  final List<SymbolListResponseModel> _allSymbols = [];
  final List<SocketSymbolData> _cachedSocketData = [];

  @visibleForTesting
  final List<String> subscribedSymbols = [];

  final TextEditingController searchController = TextEditingController();
  final ScrollController scrollController = ScrollController();
  final StreamController<List<SocketSymbolData>> socketController =
      StreamController<List<SocketSymbolData>>.broadcast();

  StreamSubscription? _socketSubscription;

  MarketBloc() : super(const MarketState()) {
    on<_UpdateScreenStatus>(_updateScreenStatus);
    on<_UpdateListOfSymbol>(_updateListOfSymbols);

    add(const MarketEvent.updateScreenStatus(LoadingStatuses.loading));
    _initializeSocketConnection();
    _fetchSymbolList();
    _setupSearchListener();
    _setupScrollListener();
  }

  void _initializeSocketConnection() async {
    try {
      var uri = Uri.parse("${ConnectionConstant.socketUrl}?token=${AppConstant.token}");
      await locator<WebSocketClient>().connect(uri);
      listenToSocket();
    } catch (e) {
      // Handle error (e.g., logging)
      add(const MarketEvent.updateScreenStatus(LoadingStatuses.error));
    }
  }

  Future<void> _fetchSymbolList() async {
    try {
      _allSymbols.addAll(await locator<SymbolService>().getListOfSymbol());
      add(MarketEvent.updateListOfSymbol(_allSymbols));
    } catch (e) {
      // Handle error (e.g., logging)
      add(const MarketEvent.updateScreenStatus(LoadingStatuses.error));
    }
  }

  @visibleForTesting
  void listenToSocket() {
    _socketSubscription = locator<WebSocketClient>().receive()!.listen((data) {
      if (data != null) {
        final decodedData = jsonDecode(data)["data"];
        if (decodedData != null) {
          final parsedData = SocketSymbolData.fromJsonList(decodedData);
          updateCachedData(parsedData);
        }
      }
    });
  }

  @visibleForTesting
  void updateCachedData(List<SocketSymbolData> newData) {
    for (var newItem in newData) {
      bool exists = false;
      for (var i = 0; i < _cachedSocketData.length; i++) {
        if (_cachedSocketData[i].symbolName == newItem.symbolName) {
          // Update the item in list2 if it exists
          _cachedSocketData[i] = newItem;
          exists = true;
          break;
        }
      }
      // If the item from list1 doesn't exist in list2, add it to list2
      if (!exists) {
        _cachedSocketData.add(newItem);
      }
    }

    socketController.sink.add(_cachedSocketData);
  }

  void _setupScrollListener() {
    scrollController.addListener(() {
      final firstVisibleIndex = scrollController.offset ~/ 60; // Adjust based on item height
      final lastVisibleIndex = firstVisibleIndex + 20;
      manageSubscriptions(_getSymbolsInView(firstVisibleIndex, lastVisibleIndex), 10);
    });
  }

  List<String> _getSymbolsInView(int start, int end) {
    return _allSymbols.sublist(start, end).map((symbol) => symbol.symbol!).toList();
  }

  void _setupSearchListener() {
    searchController.addListener(() {
      if (searchController.text.isEmpty) {
        add(MarketEvent.updateListOfSymbol(_allSymbols));
      } else {
        final filteredSymbols = _allSymbols
            .where((symbol) => symbol.displaySymbol!.toLowerCase().contains(searchController.text.toLowerCase()))
            .toList();
        add(MarketEvent.updateListOfSymbol(filteredSymbols));
      }
    });
  }

  FutureOr<void> _updateScreenStatus(_UpdateScreenStatus event, Emitter<MarketState> emit) {
    emit(state.copyWith(loadingStatus: event.status));
  }

  FutureOr<void> _updateListOfSymbols(_UpdateListOfSymbol event, Emitter<MarketState> emit) {
    final list = event.list;
    if (list.isNotEmpty) {
      list.take(20).forEach((value) => _subscribe(value.symbol!));
    }
    emit(state.copyWith(allSymbolList: list, loadingStatus: LoadingStatuses.loaded));
  }

  void _subscribe(String symbol) {
    if (!subscribedSymbols.contains(symbol)) {
      subscribedSymbols.add(symbol);
      locator<WebSocketClient>().send(jsonEncode({'type': 'subscribe', 'symbol': symbol}));
    }
  }

  void _unsubscribe(String symbol) {
    if (subscribedSymbols.contains(symbol)) {
      subscribedSymbols.remove(symbol);
      locator<WebSocketClient>().send(jsonEncode({'type': 'unsubscribe', 'symbol': symbol}));
    }
  }

  void manageSubscriptions(List<String> symbolsInView, int maxSubscriptions) {
    final symbolsToUnsubscribe = subscribedSymbols.where((symbol) => !symbolsInView.contains(symbol)).toList();
    symbolsToUnsubscribe.forEach(_unsubscribe);

    final symbolsToSubscribe = symbolsInView
        .where((symbol) => !subscribedSymbols.contains(symbol) && subscribedSymbols.length < maxSubscriptions)
        .toList();
    symbolsToSubscribe.forEach(_subscribe);
  }

  @override
  Future<void> close() async {
    await locator<WebSocketClient>().disconnect();
    await _socketSubscription?.cancel();
    socketController.close();
    return super.close();
  }
}
