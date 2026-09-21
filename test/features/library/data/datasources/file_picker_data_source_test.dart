import 'dart:typed_data';

import 'package:cross_file/src/types/interface.dart';
import 'package:drive_tunes/core/app_exceptions.dart';
import 'package:drive_tunes/features/library/data/datasources/file_picker_data_source.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_test/flutter_test.dart';

final class _FakePlatformFile extends PlatformFile {
  @override
  final String name;

  @override
  final String? path;

  _FakePlatformFile({required this.name, this.path});

  @override
  Future<int> length() {
    // TODO: implement length
    throw UnimplementedError();
  }

  @override
  int? lengthSync() {
    // TODO: implement lengthSync
    throw UnimplementedError();
  }

  @override
  Stream<Uint8List> readAsByteStream() {
    // TODO: implement readAsByteStream
    throw UnimplementedError();
  }

  @override
  Future<Uint8List> readAsBytes() {
    // TODO: implement readAsBytes
    throw UnimplementedError();
  }

  @override
  // TODO: implement uri
  Uri get uri => throw UnimplementedError();

  @override
  // TODO: implement xFile
  XFile get xFile => throw UnimplementedError();
}

void main() {
  group('FilePickerDataSource', () {
    test('should return mapped audio files when user selects files', () async {
      final dataSource = FilePickerDataSource(
        picker:
            ({
              FileType type = FileType.custom,
              List<String>? allowedExtensions,
            }) async {
              return [
                _FakePlatformFile(
                  name: 'song1.mp3',
                  path: '/path/to/song1.mp3',
                ),
                _FakePlatformFile(
                  name: 'song2.m4a',
                  path: '/path/to/song2.m4a',
                ),
              ];
            },
      );

      final result = await dataSource.scanMediaLibrary();

      expect(result.length, equals(2));
      expect(result[0]['title'], equals('song1'));
      expect(result[0]['source'], equals('file:///path/to/song1.mp3'));
      expect(result[0]['id'], isA<int>());
      expect(result[1]['title'], equals('song2'));
      expect(result[1]['source'], equals('file:///path/to/song2.m4a'));
    });

    test('should return empty list when user cancels picker', () async {
      final dataSource = FilePickerDataSource(
        picker:
            ({
              FileType type = FileType.custom,
              List<String>? allowedExtensions,
            }) async {
              return null;
            },
      );

      final result = await dataSource.scanMediaLibrary();

      expect(result, isEmpty);
    });

    test(
      'should rethrow FileSystemException when picker throws exception',
      () async {
        final dataSource = FilePickerDataSource(
          picker:
              ({
                FileType type = FileType.custom,
                List<String>? allowedExtensions,
              }) async {
                throw Exception('Picker error');
              },
        );

        expect(
          () => dataSource.scanMediaLibrary(),
          throwsA(isA<FileSystemException>()),
        );
      },
    );
  });
}
