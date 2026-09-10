import 'package:drive_tunes/core/app_exceptions.dart';
import 'package:drive_tunes/core/logger/app_logger.dart';
import 'package:drive_tunes/features/library/data/datasources/datasource_abstracts.dart';
import 'package:flutter/services.dart';
import 'package:on_audio_query/on_audio_query.dart';

final class DeviceDatasource implements MediaLibraryDatasource {
  final OnAudioQuery audioQuery;
  final AppLogger logger;

  DeviceDatasource({required this.audioQuery, required this.logger});

  @override
  Future<List<Map<String, dynamic>>> scanMediaLibrary() async {
    try {
      final songs = await audioQuery.querySongs(
        ignoreCase: true,
        orderType: OrderType.ASC_OR_SMALLER,
        uriType: UriType.EXTERNAL,
      );

      final mappedSongs = songs
          .map(
            (song) => <String, dynamic>{
              'id': song.id.toString(),
              'title': song.title,
              'source': song.data,
              'duration': song.duration ?? 0,
              'artistIds': [song.artistId.toString()],
              'albumId': song.albumId?.toString(),
            },
          )
          .toList();

      return mappedSongs;
    } on PlatformException catch (e, stackTrace) {
      if (e.code == 'MissingPermissions') {
        Error.throwWithStackTrace(
          PermissionException(message: 'Permisos denegados', cause: e),
          stackTrace,
        );
      } else {
        Error.throwWithStackTrace(
          UnknownException(message: 'Error al escanear la librería', cause: e),
          stackTrace,
        );
      }
    } catch (e, stackTrace) {
      Error.throwWithStackTrace(
        UnknownException(
          message: 'Error desconocido al obtener canciones',
          cause: e,
        ),
        stackTrace,
      );
    }
  }
}
