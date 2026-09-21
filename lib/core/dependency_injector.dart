import 'package:drive_tunes/core/database/isar_database_impl.dart';
import 'package:drive_tunes/core/errors/ui_error_bus.dart';
import 'package:drive_tunes/core/errors/ui_error_mapper.dart';
import 'package:drive_tunes/core/logger/app_logger.dart';
import 'package:drive_tunes/core/logger/app_logger_impl.dart';
import 'package:drive_tunes/core/telemetry/app_telemetry_service.dart';
import 'package:get_it/get_it.dart';

import 'package:drive_tunes/features/library/library_dependencies.dart';
import 'package:drive_tunes/features/settings/settings_dependencies.dart';

final serviceContainer = GetIt.instance;

Future<void> registerDependencies() async {
  serviceContainer.registerSingleton<AppLogger>(const AppLoggerImpl());
  serviceContainer.registerLazySingleton<IsarDatabase>(() => IsarDatabase());
  serviceContainer.registerLazySingleton<UiErrorMapper>(
    () => const UiErrorMapperImpl(),
  );
  serviceContainer.registerSingleton<UiErrorBus>(
    UiErrorBusImpl(mapper: serviceContainer<UiErrorMapper>()),
  );
  serviceContainer.registerSingleton<AppTelemetryService>(
    AppTelemetryServiceImpl(
      errorBus: serviceContainer<UiErrorBus>(),
      logger: serviceContainer<AppLogger>(),
    ),
  );
  registerSettingsDependencies(serviceContainer);
  registerLibraryDependencies(serviceContainer);
}


