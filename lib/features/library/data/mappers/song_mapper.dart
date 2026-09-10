import 'package:drive_tunes/domain/entities/song.dart';

abstract final class SongMapper {
  static Song fromMap(Map<String, dynamic> map) {
    final artistIdsRaw = map['artistIds'];
    List<String> artistIds = [];
    if (artistIdsRaw is List) {
      artistIds = artistIdsRaw.map((e) => e.toString()).toList();
    } else if (artistIdsRaw is String) {
      artistIds = [artistIdsRaw];
    }

    final artworkRaw = map['artwork'];
    final rawId = map['id'];
    final int id = rawId is int
        ? rawId
        : (int.tryParse(rawId?.toString() ?? '') ?? 0);

    return Song(
      id: id,
      title: map['title']?.toString() ?? '',
      source: Uri.parse(map['source']?.toString() ?? ''),
      duration: Duration(milliseconds: map['duration'] as int? ?? 0),
      artistIds: artistIds,
      albumId: map['albumId']?.toString(),
      artwork: artworkRaw != null ? Uri.parse(artworkRaw.toString()) : null,
    );
  }
}
