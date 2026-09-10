import 'package:drive_tunes/core/app_exceptions.dart';
import 'package:drive_tunes/features/library/data/datasources/datasource_abstracts.dart';
import 'package:file_picker/file_picker.dart';

typedef FilePickerFunction =
    Future<List<PlatformFile>?> Function({
      FileType type,
      List<String>? allowedExtensions,
    });

final class FilePickerDataSource implements MediaLibraryDatasource {
  final FilePickerFunction _picker;

  FilePickerDataSource({FilePickerFunction? picker})
    : _picker = picker ?? _defaultPicker;

  static Future<List<PlatformFile>?> _defaultPicker({
    FileType type = FileType.custom,
    List<String>? allowedExtensions,
  }) {
    return FilePicker.pickFiles(
      type: type,
      allowedExtensions: allowedExtensions,
    );
  }

  @override
  Future<List<Map<String, dynamic>>> scanMediaLibrary() async {
    try {
      final files = await _picker(
        type: FileType.custom,
        allowedExtensions: ['mp3', 'm4a', 'wav', 'flac'],
      );

      if (files == null || files.isEmpty) {
        return [];
      }
      final mappedSongs = <Map<String, dynamic>>[];

      for (final file in files) {
        final path = file.path;
        if (path == null || path.isEmpty) {
          continue;
        }

        final sourceUri = Uri.file(path).toString();
        final id = sourceUri.hashCode & 0x7FFFFFFF;
        final title = file.name.replaceAll(RegExp(r'\.[^.]+$'), '');

        mappedSongs.add(<String, dynamic>{
          'id': id,
          'title': title,
          'source': sourceUri,
          'duration': 0,
          'artistIds': <String>[],
          'albumId': null,
        });
      }

      return mappedSongs;
    } catch (e, stackTrace) {
      Error.throwWithStackTrace(
        FileSystemException(
          message: 'Error desconocido al seleccionar archivos',
          cause: e,
        ),
        stackTrace,
      );
    }
  }
}
