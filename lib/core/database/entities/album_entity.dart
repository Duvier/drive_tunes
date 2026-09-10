import 'package:drive_tunes/domain/entities/album.dart';
import 'package:isar_community/isar.dart';

part 'album_entity.g.dart';

@collection
class AlbumEntity {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  late String albumId;

  late String title;
  String? artistId;
  String? artworkUri;
  int? year;
  int? totalTracks;

  Album toDomain() {
    return Album(
      id: albumId,
      title: title,
      artistId: artistId,
      artworkUri: artworkUri != null ? Uri.parse(artworkUri!) : null,
      year: year,
      totalTracks: totalTracks,
    );
  }

  static AlbumEntity fromDomain(Album album) {
    return AlbumEntity()
      ..albumId = album.id
      ..title = album.title
      ..artistId = album.artistId
      ..artworkUri = album.artworkUri?.toString()
      ..year = album.year
      ..totalTracks = album.totalTracks;
  }
}
