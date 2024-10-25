import 'package:exinity_assessment/locator.dart';
import 'package:exinity_assessment/presentations/market/bloc/market_bloc.dart';
import 'package:exinity_assessment/presentations/market/widgets/search_view.dart';
import 'package:exinity_assessment/presentations/market/widgets/tile_view.dart';
import 'package:exinity_assessment/presentations/shared_widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MarketScreen extends StatefulWidget {
  const MarketScreen({super.key});

  @override
  State<MarketScreen> createState() => _MarketScreenState();
}

class _MarketScreenState extends State<MarketScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator<MarketBloc>(),
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          backgroundColor: Colors.grey.shade300,
          appBar: const CustomAppBar(),
          body: BlocBuilder<MarketBloc, MarketState>(
            buildWhen: (previous, current) {
              return previous.allSymbolList != current.allSymbolList;
            },
            builder: (context, state) {
              return Column(
                children: [
                  SearchView(
                    controller: context.read<MarketBloc>().searchController,
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: state.allSymbolList.length,
                      controller: context.read<MarketBloc>().scrollController,
                      itemBuilder: (context, index) {
                        return TileView(
                          title: state.allSymbolList[index].displaySymbol ?? "",
                          subtitle: state.allSymbolList[index].description ?? "",
                          symbol: state.allSymbolList[index].symbol ?? "",
                          priceStream: context.read<MarketBloc>().socketController,
                        );
                      },
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
