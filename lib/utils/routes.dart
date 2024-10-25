import 'package:exinity_assessment/presentations/market/market_screen.dart';
import 'package:flutter/material.dart';

class RoutesConstants {
  static const String initialRoute = 'initScreen';
}

final Map<String, Widget> routes = {
  RoutesConstants.initialRoute: const MarketScreen(),
};
