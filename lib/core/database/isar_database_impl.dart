import 'package:drive_tunes/core/database/database.dart';
import 'package:drive_tunes/core/database/entities/album_entity.dart';
import 'package:drive_tunes/core/database/entities/artist_entity.dart';
import 'package:drive_tunes/core/database/entities/playlist_entity.dart';
import 'package:drive_tunes/core/database/entities/song_entity.dart';
import 'package:isar_community/isar.dart';
import 'package:path_provider/path_provider.dart';

final class IsarDatabase implements Database {
  static const databaseName = 'drive_tunes';
  Isar? _isar;

  Isar get instance {
    final isar = _isar;
    if (isar == null) {
      throw StateError('Database has not been initialized.');
    }

    return isar;
  }

  @override
  Future<void> initialize() async {
    final directory = await getApplicationDocumentsDirectory();
    if (Isar.instanceNames.isEmpty) {
      _isar = await Isar.open(
        [
          SongEntitySchema,
          AlbumEntitySchema,
          ArtistEntitySchema,
          PlaylistEntitySchema,
        ],
        directory: directory.path,
        inspector: true,
        name: databaseName,
      );
    } else {
      _isar = Isar.getInstance(databaseName);
    }
  }

  @override
  Future<void> close() async {
    await _isar!.close();
  }
}
