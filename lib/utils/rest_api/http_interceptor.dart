import 'dart:async';
import 'package:dio/dio.dart';
import 'package:exinity_assessment/utils/exceptions.dart';
import 'package:exinity_assessment/utils/logger.dart';
import 'package:flutter/material.dart';

class HttpInterceptor extends InterceptorsWrapper {
  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    return handler.next(options);
  }

  @override
  Future<void> onResponse(Response response, ResponseInterceptorHandler handler) async {
    try {
      if (await _validateResponse(response)) {
        handler.next(response); // Pass the response to the next interceptor
      }
    } catch (error) {
      handler.reject(error as DioException); // Handle error
    }
  }

  @override
  Future onError(DioException err, ErrorInterceptorHandler handler) async {
    return super.onError(err, handler); // Use the default error handling
  }

  Future<bool> _validateResponse(Response response) async {
    debugPrint("Request: ${response.requestOptions.path}, Status Code: ${response.statusCode}");

    switch (response.statusCode) {
      case 200:
        return true;
      default:
        _logError(response, "Unexpected error");
        throw _buildDioException(response, response.data["detail"]["message"], response.data["detail"]["request_id"]);
    }
  }

  void _logError(Response response, String message) {
    logErrorMessage(
      error: response.statusCode,
      message: "Response Data: ${response.data} - $message",
    );
  }

  DioException _buildDioException(Response response, String message, [String? requestId]) {
    return DioException(
      error: HttpException(
        status: response.statusCode!,
        message: message,
        requestId: requestId ?? "",
      ),
      requestOptions: response.requestOptions,
    );
  }
}
