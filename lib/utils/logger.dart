import 'package:logger/logger.dart';

final logger = Logger();

dynamic logDebugMessage({required String message}) {
  logger.d(message);
}

dynamic logErrorMessage({required dynamic error, required String message}) {
  logger.e("## ERROR - $message", error: error);
}
