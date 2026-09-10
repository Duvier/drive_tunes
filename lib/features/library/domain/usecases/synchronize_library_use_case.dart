import 'package:drive_tunes/core/logger/app_logger.dart';
import 'package:drive_tunes/core/result.dart';
import 'package:drive_tunes/features/library/domain/repositories/library_repository.dart';
import 'package:drive_tunes/features/library/domain/repositories/media_library_repository.dart';
import 'package:drive_tunes/features/library/domain/services/library_synchronizer_service.dart';

final class SynchronizeLibraryUseCase {
  final MediaLibraryRepository mediaLibraryRepository;
  final LibraryRepository libraryRepository;
  final LibrarySynchronizerService librarySynchronizer;
  final AppLogger? _logger;

  const SynchronizeLibraryUseCase({
    required this.mediaLibraryRepository,
    required this.libraryRepository,
    required this.librarySynchronizer,
    this._logger,
  });

  Future<Result<void>> call() async {
    _logger?.info('Starting library synchronization');

    final resultScan = await mediaLibraryRepository.scanMediaLibrary();

    if (resultScan case FailureResult(failure: final f, stackTrace: final st)) {
      return FailureResult(f, stackTrace: st);
    }

    final scannedSongs = (resultScan as SuccessResult).data;

    final resultStored = await libraryRepository.getSongs();

    if (resultStored case FailureResult(
      failure: final f,
      stackTrace: final st,
    )) {
      return FailureResult(f, stackTrace: st);
    }

    final librarySongs = (resultStored as SuccessResult).data;

    final changes = librarySynchronizer.compare(
      scannedSongs: scannedSongs,
      librarySongs: librarySongs,
    );

    final syncResult = await libraryRepository.synchronize(changes);

    if (syncResult is SuccessResult) {
      _logger?.info(
        'Library synchronization completed: ${scannedSongs.length} scanned songs',
      );
    }

    return syncResult;
  }
}
