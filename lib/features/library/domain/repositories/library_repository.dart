import 'package:drive_tunes/core/result.dart';
import 'package:drive_tunes/domain/entities/song.dart';
import 'package:drive_tunes/features/library/domain/value_objects/synchronization_result_value_object.dart';

abstract interface class LibraryRepository {
  Future<Result<void>> saveSongs(List<Song> songs);
  Future<Result<void>> deleteSongs(List<String> ids);
  Future<Result<List<Song>>> getSongs();
  Future<Result<Song?>> getSong(String id);
  Future<Result<List<Song>>> searchSong(String query);
  Future<Result<void>> synchronize(SynchronizationResultValueObject changes);
}
