import 'package:flutter/foundation.dart';

import 'package:drive_tunes/core/database/isar_database_impl.dart';
import 'package:drive_tunes/core/dependency_injector.dart';
import 'package:drive_tunes/core/errors/ui_error_bus.dart';
import 'package:drive_tunes/core/telemetry/app_telemetry_service.dart';

final class AppInitializer {
  const AppInitializer();

  Future<void> initialize() async {
    await registerDependencies();
    await serviceContainer<IsarDatabase>().initialize();

    serviceContainer<AppTelemetryService>().initialize();

    final uiErrorBus = serviceContainer<UiErrorBus>();

    FlutterError.onError = (details) {
      uiErrorBus.emitMapped(details.exception, stackTrace: details.stack);
    };

    PlatformDispatcher.instance.onError = (error, stackTrace) {
      uiErrorBus.emitMapped(error, stackTrace: stackTrace);
      return true;
    };
  }
}
