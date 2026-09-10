import 'package:drive_tunes/core/app_failures.dart';
import 'package:drive_tunes/core/result.dart';
import 'package:drive_tunes/domain/entities/song.dart';
import 'package:drive_tunes/features/library/data/datasources/datasource_abstracts.dart';
import 'package:drive_tunes/features/library/domain/repositories/library_repository.dart';
import 'package:drive_tunes/features/library/domain/value_objects/synchronization_result_value_object.dart';

class LibraryRepositoryImpl implements LibraryRepository {
  final LibraryDatasource _dataSource;
  LibraryRepositoryImpl({required this._dataSource});

  @override
  Future<Result<void>> saveSongs(List<Song> songs) async {
    try {
      await _dataSource.saveSongs(songs);
      return SuccessResult(null);
    } catch (e, stackTrace) {
      return FailureResult(UnknownFailure(cause: e), stackTrace: stackTrace);
    }
  }

  @override
  Future<Result<List<Song>>> getSongs() async {
    try {
      final result = await _dataSource.getSongs();
      return SuccessResult(result);
    } catch (e, stackTrace) {
      return FailureResult(UnknownFailure(cause: e), stackTrace: stackTrace);
    }
  }

  @override
  Future<Result<void>> deleteSongs(List<String> ids) async {
    try {
      await _dataSource.deleteSongs(ids);
      return SuccessResult(null);
    } catch (e, stackTrace) {
      return FailureResult(UnknownFailure(cause: e), stackTrace: stackTrace);
    }
  }

  @override
  Future<Result<Song?>> getSong(String id) async {
    try {
      final result = await _dataSource.getSong(id);
      return SuccessResult(result);
    } catch (e, stackTrace) {
      return FailureResult(UnknownFailure(cause: e), stackTrace: stackTrace);
    }
  }

  @override
  Future<Result<List<Song>>> searchSong(String query) async {
    try {
      final result = await _dataSource.searchSong(query);
      return SuccessResult(result);
    } catch (e, stackTrace) {
      return FailureResult(UnknownFailure(cause: e), stackTrace: stackTrace);
    }
  }

  @override
  Future<Result<void>> synchronize(
    SynchronizationResultValueObject changes,
  ) async {
    try {
      await _dataSource.synchronize(changes);
      return SuccessResult(null);
    } catch (e, stackTrace) {
      return FailureResult(UnknownFailure(cause: e), stackTrace: stackTrace);
    }
  }
}
