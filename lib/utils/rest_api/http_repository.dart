import 'package:dio/dio.dart';
import 'package:exinity_assessment/locator.dart';
import 'package:exinity_assessment/services/general/network_info_service.dart';
import 'package:exinity_assessment/utils/constants/connection_constant.dart';
import 'package:exinity_assessment/utils/exceptions.dart';
import 'package:exinity_assessment/utils/mixins.dart';
import 'package:exinity_assessment/utils/rest_api/http_interceptor.dart';

enum RequestType { get, post, delete, put }

class HttpRepository {
  Future<dynamic> callRequest({
    required RequestType requestType,
    required String methodName,
    Map<String, dynamic> queryParam = const {},
    Model? postBody,
    FormData? formData,
  }) async {
    if (!await locator<NetworkInfoService>().checkConnectivityonLunching()) {
      throw InternetConnectionException(
          message: "Please check your internet connection");
    }

    final dioClient = _createDioClient();

    // Prepare the request data
    final data = formData ?? postBody?.toJson();

    try {
      final response = await _sendRequest(
        dioClient: dioClient,
        requestType: requestType,
        methodName: methodName,
        queryParam: queryParam,
        data: data,
      );
      return response.data;
    } on DioException catch (_) {
      rethrow; // Rethrow DioExceptions for handling upstream
    }
  }

  Dio _createDioClient() {
    final dioClient = locator<Dio>()
      ..options = BaseOptions(
        baseUrl: ConnectionConstant.restUrl,
        followRedirects: false,
        validateStatus: (status) => true,
      )
      ..interceptors.add(locator<HttpInterceptor>());
    return dioClient;
  }

  Future<Response> _sendRequest({
    required Dio dioClient,
    required RequestType requestType,
    required String methodName,
    Map<String, dynamic> queryParam = const {},
    dynamic data,
  }) async {
    switch (requestType) {
      case RequestType.get:
        return await dioClient.get(methodName, queryParameters: queryParam);
      case RequestType.post:
        return await dioClient.post(methodName,
            data: data, queryParameters: queryParam);
      case RequestType.delete:
        return await dioClient.delete(methodName,
            data: data, queryParameters: queryParam);
      case RequestType.put:
        return await dioClient.put(methodName,
            data: data, queryParameters: queryParam);
    }
  }
}
