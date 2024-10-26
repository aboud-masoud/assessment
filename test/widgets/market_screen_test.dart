import 'dart:async';

import 'package:bloc_test/bloc_test.dart';
import 'package:exinity_assessment/locator.dart';
import 'package:exinity_assessment/model/restful/symbol_list.dart';
import 'package:exinity_assessment/model/socket/symbol.dart';
import 'package:exinity_assessment/presentations/market/bloc/market_bloc.dart';
import 'package:exinity_assessment/presentations/market/market_screen.dart';
import 'package:exinity_assessment/presentations/market/widgets/search_view.dart';
import 'package:exinity_assessment/presentations/market/widgets/tile_view.dart';
import 'package:exinity_assessment/presentations/shared_widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockMarketBloc extends MockBloc<MarketEvent, MarketState> implements MarketBloc {
  @override
  final searchController = TextEditingController();
  @override
  final scrollController = ScrollController();
  @override
  final socketController = StreamController<List<SocketSymbolData>>.broadcast();
}

void main() {
  late MockMarketBloc mockMarketBloc;

  setUp(() {
    mockMarketBloc = MockMarketBloc();
    locator.registerSingleton<MarketBloc>(mockMarketBloc);
  });

  tearDown(() {
    locator.reset();
  });

  Widget createTestableWidget() {
    return MaterialApp(
      home: BlocProvider<MarketBloc>(
        create: (_) => mockMarketBloc,
        child: const MarketScreen(),
      ),
    );
  }

  testWidgets('renders CustomAppBar, SearchView, and ListView in MarketScreen', (WidgetTester tester) async {
    // Given: The MarketScreen is initialized with an empty symbol list
    when(() => mockMarketBloc.state).thenReturn(
      const MarketState(allSymbolList: []),
    );

    // When: The widget is pumped into the test environment
    await tester.pumpWidget(createTestableWidget());

    // Then: CustomAppBar, SearchView, and ListView widgets should be displayed
    expect(find.byType(CustomAppBar), findsOneWidget);
    expect(find.byType(SearchView), findsOneWidget);
    expect(find.byType(ListView), findsOneWidget);
  });

  testWidgets('displays list of symbols in ListView', (WidgetTester tester) async {
    // Given: The MarketScreen is initialized with a list of symbols
    final mockSymbols = [
      SymbolListResponseModel(
        symbol: 'AAPL',
        displaySymbol: 'Apple Inc',
        description: 'Technology Company',
      ),
      SymbolListResponseModel(
        symbol: 'GOOGL',
        displaySymbol: 'Alphabet Inc',
        description: 'Parent company of Google',
      ),
    ];

    when(() => mockMarketBloc.state).thenReturn(
      MarketState(allSymbolList: mockSymbols),
    );

    // When: The widget is pumped into the test environment
    await tester.pumpWidget(createTestableWidget());

    // Then: The ListView should display each symbol in the list
    expect(find.byType(TileView), findsNWidgets(mockSymbols.length));
    expect(find.text('Apple Inc'), findsOneWidget);
    expect(find.text('Alphabet Inc'), findsOneWidget);
  });

  testWidgets('updates search when text is entered', (WidgetTester tester) async {
    // Given: The MarketScreen is initialized with an empty search field
    when(() => mockMarketBloc.state).thenReturn(const MarketState(allSymbolList: []));

    await tester.pumpWidget(createTestableWidget());

    // When: The user enters text into the search field
    final searchField = find.byType(SearchView);
    await tester.enterText(searchField, 'AAPL');

    // Then: The searchController should update with the entered text
    expect(mockMarketBloc.searchController.text, 'AAPL');
  });

  testWidgets('updates state when new symbols are added', (WidgetTester tester) async {
    // Given: The MarketScreen starts with an empty symbol list
    final updatedSymbols = [
      SymbolListResponseModel(
        symbol: 'MSFT',
        displaySymbol: 'Microsoft Corp',
        description: 'Software Company',
      ),
    ];

    when(() => mockMarketBloc.state).thenReturn(MarketState(allSymbolList: updatedSymbols));

    // When: A new state is emitted with the updated symbols
    whenListen(
      mockMarketBloc,
      Stream.fromIterable([
        MarketState(allSymbolList: updatedSymbols),
      ]),
    );
    await tester.pumpWidget(createTestableWidget());

    await tester.pump();

    // Then: The ListView should update to display the new symbols
    expect(find.text('Microsoft Corp'), findsOneWidget);
    expect(find.byType(TileView), findsOneWidget);
  });
}
