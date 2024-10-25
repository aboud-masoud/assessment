import 'dart:async';
import 'dart:convert';

import 'package:bloc_test/bloc_test.dart';
import 'package:exinity_assessment/locator.dart';
import 'package:exinity_assessment/model/restful/symbol_list.dart';
import 'package:exinity_assessment/model/socket/symbol.dart';
import 'package:exinity_assessment/presentations/market/bloc/market_bloc.dart';
import 'package:exinity_assessment/services/symbol_service.dart';
import 'package:exinity_assessment/utils/enum/loading_statuses_enum.dart';
import 'package:exinity_assessment/utils/sockets/web_socket_client.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockSymbolService extends Mock implements SymbolService {}

class MockWebSocketClient extends Mock implements WebSocketClient {}

void main() {
  late MarketBloc marketBloc;
  late MockSymbolService mockSymbolService;
  late MockWebSocketClient mockWebSocketClient;

  setUp(() {
    mockSymbolService = MockSymbolService();
    mockWebSocketClient = MockWebSocketClient();
    // Initialize locator with mocks
    locator.registerSingleton<SymbolService>(mockSymbolService);
    locator.registerSingleton<WebSocketClient>(mockWebSocketClient);

    marketBloc = MarketBloc();

    when(() => locator<WebSocketClient>().disconnect()).thenAnswer((_) async => Future.value());
  });

  tearDown(() async {
    await locator.reset();
  });

  blocTest<MarketBloc, MarketState>(
    'emits updated state when _fetchSymbolList adds symbols',
    build: () {
      when(() => mockSymbolService.getListOfSymbol()).thenAnswer((_) async => [
            SymbolListResponseModel(symbol: 'AAPL'),
            SymbolListResponseModel(symbol: 'GOOGL'),
          ]);
      return marketBloc;
    },
    act: (bloc) => bloc.add(MarketEvent.updateListOfSymbol([
      SymbolListResponseModel(description: "", displaySymbol: "", symbol: ""),
    ])),
    expect: () => [
      isA<MarketState>().having((state) => state.allSymbolList, 'symbol list', hasLength(1)),
    ],
  );

  blocTest<MarketBloc, MarketState>(
    'updates screen status on _updateScreenStatus event',
    build: () => marketBloc,
    act: (bloc) => bloc.add(const MarketEvent.updateScreenStatus(LoadingStatuses.loading)),
    expect: () => [
      isA<MarketState>().having((state) => state.loadingStatus, 'loading status', LoadingStatuses.loading),
    ],
  );

  blocTest<MarketBloc, MarketState>(
    'updates cached socket data on socket message',
    build: () {
      when(() => mockWebSocketClient.receive()).thenAnswer((_) => Stream.value(jsonEncode({
            'data': [
              {'symbolName': 'AAPL', 'price': 150}
            ]
          })));
      return marketBloc;
    },
    act: (bloc) {
      bloc.listenToSocket();
    },
    verify: (_) {
      expect(marketBloc.socketController.stream, emits(isA<List<SocketSymbolData>>()));
    },
  );

  blocTest<MarketBloc, MarketState>(
    'subscribes and unsubscribes symbols based on scroll events',
    build: () {
      when(() => mockSymbolService.getListOfSymbol()).thenAnswer((_) async => [
            SymbolListResponseModel(symbol: 'AAPL'),
            SymbolListResponseModel(symbol: 'GOOGL'),
          ]);
      when(() => mockWebSocketClient.send(any)).thenReturn(null);
      return marketBloc;
    },
    act: (bloc) {
      bloc.manageSubscriptions(['AAPL'], 10);
    },
    verify: (_) {
      verify(() => mockWebSocketClient.send(jsonEncode({'type': 'subscribe', 'symbol': 'AAPL'}))).called(1);
    },
  );

  blocTest<MarketBloc, MarketState>(
    'unsubscribes symbols not in view when scroll changes',
    build: () {
      when(() => mockSymbolService.getListOfSymbol()).thenAnswer((_) async => [
            SymbolListResponseModel(symbol: 'AAPL'),
            SymbolListResponseModel(symbol: 'GOOGL'),
          ]);
      when(() => mockWebSocketClient.send(any)).thenReturn(null);

      marketBloc.subscribedSymbols.addAll(['AAPL', 'GOOGL']);
      return marketBloc;
    },
    act: (bloc) {
      bloc.manageSubscriptions(['AAPL'], 10);
    },
    verify: (_) {
      verify(() => mockWebSocketClient.send(jsonEncode({'type': 'unsubscribe', 'symbol': 'GOOGL'}))).called(1);
    },
  );
}
