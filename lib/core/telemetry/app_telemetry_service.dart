import 'dart:async';

import 'package:drive_tunes/core/errors/ui_error.dart';
import 'package:drive_tunes/core/errors/ui_error_bus.dart';
import 'package:drive_tunes/core/logger/app_logger.dart';

abstract class AppTelemetryService {
  void initialize();
  void dispose();
}

class AppTelemetryServiceImpl implements AppTelemetryService {
  final UiErrorBus errorBus;
  final AppLogger logger;
  StreamSubscription<UiError>? _subscription;

  AppTelemetryServiceImpl({required this.errorBus, required this.logger});

  @override
  void initialize() {
    _subscription?.cancel();
    _subscription = errorBus.stream.listen(_onUiErrorEmitted);
  }

  void _onUiErrorEmitted(UiError error) {
    final logMessage =
        '[${error.feature?.toUpperCase() ?? "GLOBAL"}] ${error.message}';

    switch (error.severity) {
      case UiErrorSeverity.info:
        logger.info(
          logMessage,
          error: error.originalError,
          stackTrace: error.stackTrace,
        );
        break;
      case UiErrorSeverity.warning:
        logger.warning(
          logMessage,
          error: error.originalError,
          stackTrace: error.stackTrace,
        );
        break;
      case UiErrorSeverity.error:
      case UiErrorSeverity.critical:
        logger.error(
          logMessage,
          error: error.originalError,
          stackTrace: error.stackTrace,
        );
        // Punto de extensión: Registrar error en Crashlytics / Sentry / Datadog
        // FirebaseCrashlytics.instance.recordError(
        //   error.originalError ?? Exception(error.message),
        //   error.stackTrace,
        //   reason: logMessage,
        //   fatal: error.severity == UiErrorSeverity.critical,
        // );
        break;
    }
  }

  @override
  void dispose() {
    _subscription?.cancel();
    _subscription = null;
  }
}
