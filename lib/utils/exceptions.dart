class HttpException implements Exception {
  HttpException(
      {required this.status, required this.message, required this.requestId});
  final String message;
  final int status;
  final String requestId;
}

class InternetConnectionException implements Exception {
  InternetConnectionException({required this.message});
  final String message;
}

abstract class SocketException implements Exception {
  const SocketException({required this.message, this.cause, this.stackTrace});

  final String message;
  final Object? cause;
  final StackTrace? stackTrace;
}

class ConnectionException extends SocketException {
  const ConnectionException({
    required super.message,
    super.cause,
    super.stackTrace,
  });
}

class DisconnectionException extends SocketException {
  const DisconnectionException({
    required super.message,
    super.cause,
    super.stackTrace,
  });
}

class SocketSendException extends SocketException {
  const SocketSendException({
    required super.message,
    super.cause,
    super.stackTrace,
  });
}

class SocketReceiveException extends SocketException {
  const SocketReceiveException({
    required super.message,
    super.cause,
    super.stackTrace,
  });
}
