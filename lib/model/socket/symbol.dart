import 'package:exinity_assessment/utils/model_checker.dart';

class SocketSymbolData with ModelChecker {
  double? price;
  String? symbolName;

  SocketSymbolData({this.price, this.symbolName});

  static List<SocketSymbolData> fromJsonList(List<dynamic> result) {
    return result.map((json) => SocketSymbolData.fromJson(json)).toList();
  }

  SocketSymbolData.fromJson(Map<String, dynamic> json) {
    price = convertToDouble(json['p']);
    symbolName = json['s'];
  }
}
