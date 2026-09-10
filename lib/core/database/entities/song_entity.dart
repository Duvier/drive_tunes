import 'package:drive_tunes/domain/entities/song.dart';
import 'package:isar_community/isar.dart';

part 'song_entity.g.dart';

@collection
class SongEntity {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  late int songId;

  late String title;
  late int durationMs;
  late String sourceUri;
  late String? albumId;
  List<String> artistIds = [];
  String? artworkUri;

  Song toDomain() {
    return Song(
      id: songId,
      title: title,
      duration: Duration(milliseconds: durationMs),
      source: Uri.parse(sourceUri),
      artistIds: artistIds,
      artwork: artworkUri != null ? Uri.parse(artworkUri!) : null,
    );
  }

  static SongEntity fromDomain(Song song) {
    return SongEntity()
      ..songId = song.id
      ..title = song.title
      ..durationMs = song.duration.inMilliseconds
      ..sourceUri = song.source.toString()
      ..albumId = song.albumId
      ..artistIds = song.artistIds
      ..artworkUri = song.artwork?.toString();
  }
}
