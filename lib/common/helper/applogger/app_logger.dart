import 'package:logger/logger.dart';

class Log {
  static final _logger = Logger(
      printer: PrettyPrinter(
    methodCount: 2,
    errorMethodCount: 8,
    lineLength: 120,
    colors: true,
  ));

  static void d(String message) {
    _logger.d(message);
  }

  static void e(String message) {
    _logger.e(message);
  }

  static void i(String message) {
    _logger.i(message);
  }

  static void w(String message) {
    _logger.w(message);
  }
}
