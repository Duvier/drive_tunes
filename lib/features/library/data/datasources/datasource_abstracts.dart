import 'package:drive_tunes/domain/entities/song.dart';
import 'package:drive_tunes/features/library/domain/value_objects/synchronization_result_value_object.dart';

abstract interface class MediaLibraryDatasource {
  Future<List<Map<String, dynamic>>> scanMediaLibrary();
}

abstract interface class LibraryDatasource {
  Future<void> saveSongs(List<Song> songs);
  Future<void> deleteSongs(List<String> ids);
  Future<List<Song>> getSongs();
  Future<Song?> getSong(String id);
  Future<List<Song>> searchSong(String query);
  Future<void> synchronize(SynchronizationResultValueObject changes);
}
