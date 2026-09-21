import 'package:flutter_test/flutter_test.dart';
import 'package:drive_tunes/core/errors/ui_error.dart';
import 'package:drive_tunes/core/errors/ui_error_bus.dart';
import 'package:drive_tunes/core/errors/ui_error_mapper.dart';
import 'package:drive_tunes/core/logger/app_logger.dart';
import 'package:drive_tunes/core/telemetry/app_telemetry_service.dart';

final class _MockAppLogger implements AppLogger {
  final List<String> loggedErrors = [];
  final List<String> loggedWarnings = [];
  final List<String> loggedInfos = [];

  @override
  void debug(String message, {Object? error, StackTrace? stackTrace}) {}

  @override
  void error(String message, {Object? error, StackTrace? stackTrace}) {
    loggedErrors.add(message);
  }

  @override
  void info(String message, {Object? error, StackTrace? stackTrace}) {
    loggedInfos.add(message);
  }

  @override
  void warning(String message, {Object? error, StackTrace? stackTrace}) {
    loggedWarnings.add(message);
  }
}

void main() {
  late UiErrorMapper mapper;
  late UiErrorBus bus;
  late _MockAppLogger mockLogger;
  late AppTelemetryService telemetryService;

  setUp(() {
    mapper = const UiErrorMapperImpl();
    bus = UiErrorBusImpl(mapper: mapper);
    mockLogger = _MockAppLogger();
    telemetryService = AppTelemetryServiceImpl(
      errorBus: bus,
      logger: mockLogger,
    );
    telemetryService.initialize();
  });

  tearDown(() {
    telemetryService.dispose();
    bus.dispose();
  });

  group('AppTelemetryService Tests', () {
    test('Should log info when UiError has severity info', () async {
      bus.emit(
        UiError(
          message: 'Info message',
          severity: UiErrorSeverity.info,
          feature: 'settings',
        ),
      );

      await Future.delayed(Duration.zero);

      expect(mockLogger.loggedInfos.length, equals(1));
      expect(mockLogger.loggedInfos.first, contains('[SETTINGS] Info message'));
    });

    test('Should log error when UiError has severity error', () async {
      bus.emit(
        UiError(
          message: 'Error message',
          severity: UiErrorSeverity.error,
          feature: 'library',
        ),
      );

      await Future.delayed(Duration.zero);

      expect(mockLogger.loggedErrors.length, equals(1));
      expect(
        mockLogger.loggedErrors.first,
        contains('[LIBRARY] Error message'),
      );
    });

    test('Should stop listening when disposed', () async {
      telemetryService.dispose();

      bus.emit(UiError(message: 'Ignored message'));

      await Future.delayed(Duration.zero);

      expect(mockLogger.loggedErrors, isEmpty);
    });
  });
}
