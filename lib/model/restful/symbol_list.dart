class SymbolListResponseModel {
  String? description;
  String? displaySymbol;
  String? symbol;

  SymbolListResponseModel({this.description, this.displaySymbol, this.symbol});

  SymbolListResponseModel.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    displaySymbol = json['displaySymbol'];
    symbol = json['symbol'];
  }

  static List<SymbolListResponseModel> fromJsonList(List<dynamic> result) {
    return result.map((json) => SymbolListResponseModel.fromJson(json)).toList();
  }
}
