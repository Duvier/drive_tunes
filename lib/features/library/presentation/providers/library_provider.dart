import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:drive_tunes/core/dependency_injector.dart';
import 'package:drive_tunes/core/errors/ui_error_bus.dart';
import 'package:drive_tunes/core/result.dart';
import 'package:drive_tunes/domain/entities/song.dart';
import 'package:drive_tunes/features/library/domain/usecases/get_songs_use_case.dart';
import 'package:drive_tunes/features/library/domain/usecases/synchronize_library_use_case.dart';

final libraryProvider = AsyncNotifierProvider<LibraryNotifier, List<Song>>(
  name: 'LibraryProvider',
  () => LibraryNotifier(
    getSongsUseCase: serviceContainer<GetSongsUseCase>(),
    synchronizeLibraryUseCase: serviceContainer<SynchronizeLibraryUseCase>(),
    uiErrorBus: serviceContainer<UiErrorBus>(),
  ),
);

final class LibraryNotifier extends AsyncNotifier<List<Song>> {
  final GetSongsUseCase getSongsUseCase;
  final SynchronizeLibraryUseCase synchronizeLibraryUseCase;
  final UiErrorBus uiErrorBus;

  LibraryNotifier({
    required this.getSongsUseCase,
    required this.synchronizeLibraryUseCase,
    required this.uiErrorBus,
  });

  @override
  Future<List<Song>> build() async {
    final result = await getSongsUseCase();
    switch (result) {
      case SuccessResult(data: final songs):
        return songs;

      case FailureResult(failure: final failure, stackTrace: final stackTrace):
        uiErrorBus.emitMapped(
          failure,
          stackTrace: stackTrace,
          feature: 'library',
          action: () => ref.invalidateSelf(),
        );

        Error.throwWithStackTrace(failure, stackTrace ?? StackTrace.current);
    }
  }

  Future<void> synchronize() async {
    try {
      final syncResult = await synchronizeLibraryUseCase();
      syncResult as int;
      switch (syncResult) {
        case FailureResult(
          failure: final failure,
          stackTrace: final stackTrace,
        ):
          uiErrorBus.emitMapped(
            failure,
            stackTrace: stackTrace,
            feature: 'library',
            action: () => synchronize(),
          );

        case SuccessResult():
          ref.invalidateSelf();
      }
    } catch (e, stackTrace) {
      uiErrorBus.emitMapped(
        e,
        stackTrace: stackTrace,
        feature: 'library',
        action: () => synchronize(),
      );
    }
  }
}
