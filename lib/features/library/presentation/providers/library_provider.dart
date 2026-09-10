import 'package:drive_tunes/core/app_failures.dart';
import 'package:drive_tunes/features/settings/domain/enums/access_enum.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:drive_tunes/core/dependency_injector.dart';
import 'package:drive_tunes/core/result.dart';
import 'package:drive_tunes/domain/entities/song.dart';
import 'package:drive_tunes/features/library/domain/usecases/get_songs_use_case.dart';
import 'package:drive_tunes/features/library/domain/usecases/synchronize_library_use_case.dart';
import 'package:drive_tunes/features/settings/domain/usecases/check_permission_use_case.dart';
import 'package:drive_tunes/features/settings/domain/usecases/request_permission_use_case.dart';

final libraryProvider = AsyncNotifierProvider<LibraryNotifier, List<Song>>(
  () => LibraryNotifier(
    getSongsUseCase: serviceContainer<GetSongsUseCase>(),
    synchronizeLibraryUseCase: serviceContainer<SynchronizeLibraryUseCase>(),
    checkPermissionUseCase: serviceContainer<CheckPermissionUseCase>(),
    requestPermissionUseCase: serviceContainer<RequestPermissionUseCase>(),
  ),
);

final class LibraryNotifier extends AsyncNotifier<List<Song>> {
  final GetSongsUseCase _getSongsUseCase;
  final SynchronizeLibraryUseCase _synchronizeLibraryUseCase;
  final CheckPermissionUseCase _checkPermissionUseCase;
  final RequestPermissionUseCase _requestPermissionUseCase;

  LibraryNotifier({
    required this._getSongsUseCase,
    required this._synchronizeLibraryUseCase,
    required this._checkPermissionUseCase,
    required this._requestPermissionUseCase,
  });

  @override
  Future<List<Song>> build() async {
    final result = await _getSongsUseCase();

    final data = switch (result) {
      SuccessResult(data: final songs) => songs,
      FailureResult(failure: final failure, stackTrace: final stackTrace) =>
        Error.throwWithStackTrace(failure, stackTrace ?? StackTrace.current),
    };

    return data;
  }

  Future<void> synchronize() async {
    try {
      final permissionResult = await _ensurePermission();
      permissionResult as int;
      switch (permissionResult) {
        case FailureResult(failure: final f, stackTrace: final st):
          state = AsyncError(f, st ?? StackTrace.current);
          return;

        case SuccessResult():
          break;
      }

      final syncResult = await _synchronizeLibraryUseCase();

      switch (syncResult) {
        case FailureResult(
          failure: final failure,
          stackTrace: final stackTrace,
        ):
          state = AsyncError(failure, stackTrace ?? StackTrace.current);

        case SuccessResult():
          ref.invalidateSelf();
      }
    } catch (e, stackTrace) {
      state = AsyncError(SynchronizationFailure(cause: e), stackTrace);
    }
  }

  Future<Result<void>> _ensurePermission() async {
    final permissionResult = await _checkPermissionUseCase();

    switch (permissionResult) {
      case FailureResult(failure: final f, stackTrace: final st):
        return FailureResult(f, stackTrace: st);

      case SuccessResult(data: final access):
        if (access == AppAccess.allowed) return SuccessResult(null);
    }

    final requestResult = await _requestPermissionUseCase();

    switch (requestResult) {
      case FailureResult(failure: final f, stackTrace: final st):
        return FailureResult(f, stackTrace: st);

      case SuccessResult(data: final access):
        if (access != AppAccess.allowed) {
          return FailureResult(
            PermissionFailure(),
            stackTrace: StackTrace.current,
          );
        }
        return SuccessResult(null);
    }
  }
}
