import 'package:drive_tunes/domain/entities/song.dart';
import 'package:drive_tunes/features/library/domain/value_objects/synchronization_result_value_object.dart';

class LibrarySynchronizerService {
  SynchronizationResultValueObject compare({
    required List<Song> scannedSongs,
    required List<Song> librarySongs,
  }) {
    final librarySongIds = librarySongs.map((e) => e.id).toSet();
    final scannedSongIds = scannedSongs.map((e) => e.id).toSet();
    final songsToAdd = scannedSongs
        .where((e) => !librarySongIds.contains(e.id))
        .toList();
    final songsToUpdate = scannedSongs
        .where((e) => librarySongIds.contains(e.id))
        .toList();
    final deletedSongIds = librarySongIds
        .where((e) => !scannedSongIds.contains(e))
        .toList();

    return SynchronizationResultValueObject(
      newSongs: songsToAdd,
      updatedSongs: songsToUpdate,
      deletedSongIds: deletedSongIds,
    );
  }
}
