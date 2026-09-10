import 'package:drive_tunes/core/app_exceptions.dart';
import 'package:drive_tunes/core/app_failures.dart';
import 'package:drive_tunes/core/result.dart';
import 'package:drive_tunes/domain/entities/song.dart';
import 'package:drive_tunes/features/library/data/datasources/datasource_abstracts.dart';
import 'package:drive_tunes/features/library/data/mappers/song_mapper.dart';
import 'package:drive_tunes/features/library/domain/repositories/media_library_repository.dart';

class MediaLibraryRepositoryImpl implements MediaLibraryRepository {
  final MediaLibraryDatasource _dataSource;

  MediaLibraryRepositoryImpl({required this._dataSource});

  @override
  Future<Result<List<Song>>> scanMediaLibrary() async {
    try {
      final result = await _dataSource.scanMediaLibrary();

      final songs = result.map(SongMapper.fromMap).toList();
      return SuccessResult(songs);
    } on PermissionException catch (e, stackTrace) {
      return FailureResult(PermissionFailure(cause: e), stackTrace: stackTrace);
    } on FileSystemException catch (e, stackTrace) {
      return FailureResult(
        FileSystemFailure(cause: e.cause),
        stackTrace: stackTrace,
      );
    } on UnknownException catch (e, stackTrace) {
      return FailureResult(UnknownFailure(cause: e), stackTrace: stackTrace);
    } catch (e, stackTrace) {
      return FailureResult(UnknownFailure(cause: e), stackTrace: stackTrace);
    }
  }
}
