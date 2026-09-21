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
  final GetSongsUseCase _getSongsUseCase;
  final SynchronizeLibraryUseCase _synchronizeLibraryUseCase;
  final UiErrorBus _uiErrorBus;

  LibraryNotifier({
    required this._getSongsUseCase,
    required this._synchronizeLibraryUseCase,
    required this._uiErrorBus,
  });

  @override
  Future<List<Song>> build() async {
    final result = await _getSongsUseCase();
    switch (result) {
      case SuccessResult(data: final songs):
        return songs;

      case FailureResult(failure: final failure, stackTrace: final stackTrace):
        _uiErrorBus.emitMapped(
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
      final syncResult = await _synchronizeLibraryUseCase();
      syncResult as int;
      switch (syncResult) {
        case FailureResult(
          failure: final failure,
          stackTrace: final stackTrace,
        ):
          _uiErrorBus.emitMapped(
            failure,
            stackTrace: stackTrace,
            feature: 'library',
            action: () => synchronize(),
          );

        case SuccessResult():
          ref.invalidateSelf();
      }
    } catch (e, stackTrace) {
      _uiErrorBus.emitMapped(
        e,
        stackTrace: stackTrace,
        feature: 'library',
        action: () => synchronize(),
      );
    }
  }
}
