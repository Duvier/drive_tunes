import 'package:flutter/foundation.dart';

import 'app_logger.dart';

final class AppLoggerImpl implements AppLogger {
  const AppLoggerImpl();

  @override
  void debug(String message) {
    debugPrint('[DEBUG] $message');
  }

  @override
  void info(String message) {
    debugPrint('[INFO] $message');
  }

  @override
  void warning(String message, {Object? error, StackTrace? stackTrace}) {
    debugPrint('[WARNING] $message');
    if (error != null) {
      debugPrint('Error: $error');
    }
    if (stackTrace != null) {
      debugPrint('StackTrace:\n$stackTrace');
    }
  }

  @override
  void error(String message, {Object? error, StackTrace? stackTrace}) {
    debugPrint('[ERROR] $message');
    if (error != null) {
      debugPrint('Error: $error');
    }
    if (stackTrace != null) {
      debugPrint('StackTrace:\n$stackTrace');
    }
  }
}
