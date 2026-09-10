import 'package:drive_tunes/core/app_failures.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:drive_tunes/core/logger/app_logger.dart';

final class AppProviderObserver extends ProviderObserver {
  const AppProviderObserver(this.logger);

  final AppLogger logger;

  @override
  void providerDidFail(
    ProviderObserverContext context,
    Object error,
    StackTrace stackTrace,
  ) {
    final originalCause = switch (error) {
      AppFailure(cause: final cause?) => cause,
      _ => null,
    };

    final message = originalCause != null
        ? 'Provider failed: ${context.provider.name ?? context.provider.runtimeType} | Causa: $originalCause'
        : 'Provider failed: ${context.provider.name ?? context.provider.runtimeType}';

    logger.error(message, error: error, stackTrace: stackTrace);
  }
}
