import 'package:drive_tunes/core/app_exceptions.dart';
import 'package:drive_tunes/core/database/entities/song_entity.dart';
import 'package:drive_tunes/core/database/isar_database_impl.dart';
import 'package:drive_tunes/core/logger/app_logger.dart';
import 'package:drive_tunes/domain/entities/song.dart';
import 'package:drive_tunes/features/library/data/datasources/datasource_abstracts.dart';
import 'package:drive_tunes/features/library/domain/value_objects/synchronization_result_value_object.dart';
import 'package:isar_community/isar.dart';

final class IsarDatabaseDatasource implements LibraryDatasource {
  final IsarDatabase isar;
  final AppLogger logger;
  late Isar _isarInstance;
  IsarDatabaseDatasource({required this.isar, required this.logger}) {
    _isarInstance = isar.instance;
  }

  @override
  Future<void> saveSongs(List<Song> songs) async {
    try {
      final songsToSave = songs.map(SongEntity.fromDomain).toList();
      await _isarInstance.writeTxn(() async {
        await _isarInstance.songEntitys.putAll(songsToSave);
      });
    } catch (e, stackTrace) {
      logger.error(
        'Failed to save songs to local database',
        error: e,
        stackTrace: stackTrace,
      );
      Error.throwWithStackTrace(
        UnknownException(message: 'Error al guardar canciones', cause: e),
        stackTrace,
      );
    }
  }

  @override
  Future<List<Song>> getSongs() async {
    // TODO: No me gusta hacer el mapeo aqui, pienso que deberia estar en una capa superior, por ejemplo en el Repository
    try {
      return await _isarInstance.songEntitys.where().findAll().then(
        (songs) => songs.map((song) => song.toDomain()).toList(),
      );
    } catch (e, stackTrace) {
      logger.error(
        'Failed to get songs from local database',
        error: e,
        stackTrace: stackTrace,
      );
      Error.throwWithStackTrace(
        UnknownException(message: 'Error al obtener canciones', cause: e),
        stackTrace,
      );
    }
  }

  @override
  Future<void> deleteSongs(List<String> ids) async {
    try {
      await _isarInstance.writeTxn(() async {
        await _isarInstance.songEntitys.deleteAll(
          ids.map((id) => int.parse(id)).toList(),
        );
      });
    } catch (e, stackTrace) {
      logger.error(
        'Failed to delete songs from local database',
        error: e,
        stackTrace: stackTrace,
      );
      Error.throwWithStackTrace(
        UnknownException(message: 'Error al eliminar canciones', cause: e),
        stackTrace,
      );
    }
  }

  @override
  Future<Song?> getSong(String id) async {
    try {
      return await _isarInstance.songEntitys
          .get(int.parse(id))
          .then((song) => song?.toDomain());
    } catch (e, stackTrace) {
      logger.error(
        'Failed to get song $id from local database',
        error: e,
        stackTrace: stackTrace,
      );
      Error.throwWithStackTrace(
        UnknownException(message: 'Error al obtener canción $id', cause: e),
        stackTrace,
      );
    }
  }

  @override
  Future<List<Song>> searchSong(String query) async {
    try {
      return await _isarInstance.songEntitys
          .filter()
          .titleContains(query)
          .findAll()
          .then((songs) => songs.map((song) => song.toDomain()).toList());
    } catch (e, stackTrace) {
      logger.error(
        'Failed to search song in local database',
        error: e,
        stackTrace: stackTrace,
      );
      Error.throwWithStackTrace(
        UnknownException(message: 'Error al buscar canciones', cause: e),
        stackTrace,
      );
    }
  }

  @override
  Future<void> synchronize(SynchronizationResultValueObject changes) async {
    try {
      await _isarInstance.writeTxn(() async {
        await _isarInstance.songEntitys.putAll(
          changes.newSongs.map(SongEntity.fromDomain).toList(),
        );
        await _isarInstance.songEntitys.deleteAll(changes.deletedSongIds);
      });
    } catch (e, stackTrace) {
      logger.error(
        'Failed to synchronize local database',
        error: e,
        stackTrace: stackTrace,
      );
      Error.throwWithStackTrace(
        UnknownException(message: 'Error al sincronizar la librería', cause: e),
        stackTrace,
      );
    }
  }
}
