import 'package:flutter/foundation.dart';

import 'package:drive_tunes/core/database/isar_database_impl.dart';
import 'package:drive_tunes/core/dependency_injector.dart';
import 'package:drive_tunes/core/logger/app_logger.dart';

final class AppInitializer {
  const AppInitializer();

  Future<void> initialize() async {
    await registerDependencies();
    await serviceContainer<IsarDatabase>().initialize();

    final logger = serviceContainer<AppLogger>();

    FlutterError.onError = (details) {
      logger.error(
        'Flutter framework error',
        error: details.exception,
        stackTrace: details.stack,
      );
    };

    PlatformDispatcher.instance.onError = (error, stackTrace) {
      logger.error(
        'Unhandled platform error',
        error: error,
        stackTrace: stackTrace,
      );
      return true;
    };
  }
}

