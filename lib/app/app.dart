import 'package:drive_tunes/core/errors/ui_error_bus.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/material.dart';

import 'package:drive_tunes/app/router.dart';
import 'package:drive_tunes/core/errors/global_ui_error_listener.dart';
import 'package:drive_tunes/core/dependency_injector.dart';
// import 'package:drive_tunes/core/logger/app_logger.dart';
// import 'package:drive_tunes/core/riverpod/app_provider_observer.dart';

class DriveTunesApp extends HookConsumerWidget {
  const DriveTunesApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ProviderScope(
      // observers: [AppProviderObserver(serviceContainer<AppLogger>())],
      child: MaterialApp.router(
        title: 'Drive Tunes',
        debugShowCheckedModeBanner: false,
        routerConfig: router,
        builder: (context, child) {
          return GlobalUiErrorListener(
            errorBus: serviceContainer<UiErrorBus>(),
            child: child!,
          );
        },
      ),
    );
  }
}
