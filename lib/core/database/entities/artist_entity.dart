import 'package:drive_tunes/domain/entities/artist.dart';
import 'package:isar_community/isar.dart';

part 'artist_entity.g.dart';

@collection
class ArtistEntity {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  late String artistId;

  late String name;
  String? artworkUri;

  Artist toDomain() {
    return Artist(
      id: artistId,
      name: name,
      artworkUri: artworkUri != null ? Uri.parse(artworkUri!) : null,
    );
  }

  static ArtistEntity fromDomain(Artist artist) {
    return ArtistEntity()
      ..artistId = artist.id
      ..name = artist.name
      ..artworkUri = artist.artworkUri?.toString();
  }
}
