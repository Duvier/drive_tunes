import 'package:drive_tunes/domain/entities/playlist.dart';
import 'package:isar_community/isar.dart';

part 'playlist_entity.g.dart';

@collection
class PlaylistEntity {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  late String playlistId;

  late String name;
  List<String> songIds = [];
  String? artworkUri;
  late DateTime createdAt;

  Playlist toDomain() {
    return Playlist(
      id: playlistId,
      name: name,
      songIds: songIds,
      artworkUri: artworkUri != null ? Uri.parse(artworkUri!) : null,
      createdAt: createdAt,
    );
  }

  static PlaylistEntity fromDomain(Playlist playlist) {
    return PlaylistEntity()
      ..playlistId = playlist.id
      ..name = playlist.name
      ..songIds = playlist.songIds
      ..artworkUri = playlist.artworkUri?.toString()
      ..createdAt = playlist.createdAt;
  }
}
