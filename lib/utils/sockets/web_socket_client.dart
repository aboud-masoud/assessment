import 'dart:async';
import 'package:exinity_assessment/locator.dart';
import 'package:exinity_assessment/services/general/network_info_service.dart';
import 'package:exinity_assessment/utils/exceptions.dart';
import 'package:exinity_assessment/utils/logger.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class WebSocketClient {
  WebSocketChannel? _channel;

  Future<void> connect(Uri uri) async {
    if (!await locator<NetworkInfoService>().checkConnectivityonLunching()) {
      throw InternetConnectionException(
          message: "Please check your internet connection");
    }
    try {
      _channel = WebSocketChannel.connect(uri);
    } catch (error, stackTrace) {
      _logAndThrowConnectionError(
          error, stackTrace, 'Failed to connect to WebSocket');
    }
  }

  Future<void> disconnect() async {
    if (_channel == null) return;

    try {
      await _channel?.sink.close();
      _channel = null;
    } catch (error, stackTrace) {
      _logAndThrowDisconnectionError(
          error, stackTrace, 'Failed to disconnect from WebSocket');
    }
  }

  void send(dynamic message) {
    if (_channel == null) {
      _logAndThrowSendError(
          'Failed to send message: WebSocket is not connected');
      return;
    }

    try {
      _channel!.sink.add(message);
    } catch (error, stackTrace) {
      _logAndThrowDisconnectionError(
          error, stackTrace, 'Failed to send message through WebSocket');
    }
  }

  Stream<dynamic>? receive() {
    if (_channel == null) {
      _logAndThrowReceiveError(
          'Failed to receive message: WebSocket is not connected');
      return null;
    }

    try {
      return _channel!.stream;
    } catch (error, stackTrace) {
      _logAndThrowReceiveError(
          'Failed to receive data from WebSocket', error, stackTrace);
      return null;
    }
  }

  // Helper methods for error logging and throwing exceptions
  void _logAndThrowConnectionError(
      dynamic error, StackTrace stackTrace, String message) {
    logErrorMessage(error: message, message: message);
    throw ConnectionException(
        message: message, cause: error, stackTrace: stackTrace);
  }

  void _logAndThrowDisconnectionError(
      dynamic error, StackTrace stackTrace, String message) {
    logErrorMessage(error: message, message: message);
    throw DisconnectionException(
        message: message, cause: error, stackTrace: stackTrace);
  }

  void _logAndThrowSendError(String message) {
    logErrorMessage(error: message, message: message);
    throw const SocketSendException(message: 'WebSocket is not connected');
  }

  void _logAndThrowReceiveError(String message,
      [dynamic error, StackTrace? stackTrace]) {
    logErrorMessage(error: message, message: message);
    throw SocketReceiveException(
        message: message, cause: error, stackTrace: stackTrace);
  }
}
