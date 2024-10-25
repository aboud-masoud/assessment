import 'package:exinity_assessment/model/restful/symbol_list.dart';
import 'package:exinity_assessment/utils/constants/connection_constant.dart';
import 'package:exinity_assessment/utils/constants/app_constant.dart';
import 'package:exinity_assessment/utils/mixins.dart';
import 'package:exinity_assessment/utils/rest_api/http_repository.dart';

class SymbolService with Service {
  Future<List<SymbolListResponseModel>> getListOfSymbol() async {
    final response = await repository.callRequest(
      requestType: RequestType.get,
      methodName: ConnectionConstant.getSybmol,
      queryParam: {"exchange": "oanda", "token": AppConstant.token},
    );
    return SymbolListResponseModel.fromJsonList(response);
  }
}
