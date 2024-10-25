import 'dart:async';
import 'package:exinity_assessment/model/socket/symbol.dart';
import 'package:flutter/material.dart';

class TileView extends StatefulWidget {
  final String title;
  final String symbol;
  final String subtitle;
  final StreamController<List<SocketSymbolData>?> priceStream;

  const TileView({
    super.key,
    required this.title,
    required this.symbol,
    required this.subtitle,
    required this.priceStream,
  });

  @override
  State<TileView> createState() => _TileViewState();
}

class _TileViewState extends State<TileView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 8),
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 0.1),
          gradient: const LinearGradient(
            colors: [Colors.black12, Colors.grey, Colors.white],
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildTitleSection(),
              _buildPriceSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTitleSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(widget.subtitle),
      ],
    );
  }

  Widget _buildPriceSection() {
    return StreamBuilder<List<SocketSymbolData>?>(
      initialData: const [],
      stream: widget.priceStream.stream,
      builder: (context, snapshot) {
        if (!snapshot.hasData || snapshot.data == null) {
          return _buildLoadingIndicator();
        }

        // Extract the matching symbol data
        final symbolData = snapshot.data!.where((element) => element.symbolName == widget.symbol);

        if (symbolData.isNotEmpty) {
          return Text(
            symbolData.first.price!.toStringAsFixed(5),
            style: const TextStyle(fontWeight: FontWeight.bold),
          );
        } else {
          return _buildLoadingIndicator();
        }
      },
    );
  }

  Widget _buildLoadingIndicator() {
    return const SizedBox(
      width: 10,
      height: 10,
      child: CircularProgressIndicator(
        color: Color(0xff444444),
      ),
    );
  }
}
