import 'package:drive_tunes/domain/entities/song.dart';

final class SynchronizationResultValueObject {
  const SynchronizationResultValueObject({
    required this.newSongs,
    required this.updatedSongs,
    required this.deletedSongIds,
  });

  final List<Song> newSongs;

  final List<Song> updatedSongs;

  final List<int> deletedSongIds;
}
