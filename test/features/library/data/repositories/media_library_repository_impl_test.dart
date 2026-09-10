import 'package:drive_tunes/core/app_exceptions.dart';
import 'package:drive_tunes/core/app_failures.dart';
import 'package:drive_tunes/core/result.dart';
import 'package:drive_tunes/domain/entities/song.dart';
import 'package:drive_tunes/features/library/data/datasources/datasource_abstracts.dart';
import 'package:drive_tunes/features/library/data/repositories/media_library_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';

final class _FakeMediaLibraryDatasource implements MediaLibraryDatasource {
  List<Map<String, dynamic>>? mockResult;
  Object? exceptionToThrow;

  @override
  Future<List<Map<String, dynamic>>> scanMediaLibrary() async {
    if (exceptionToThrow != null) {
      throw exceptionToThrow!;
    }
    return mockResult ?? [];
  }
}

void main() {
  group('MediaLibraryRepositoryImpl', () {
    late _FakeMediaLibraryDatasource mediaDatasource;
    late MediaLibraryRepositoryImpl repository;

    setUp(() {
      mediaDatasource = _FakeMediaLibraryDatasource();
      repository = MediaLibraryRepositoryImpl(
        dataSource: mediaDatasource,
      );
    });

    test('scanMediaLibrary should return SuccessResult with mapped songs when datasource succeeds', () async {
      mediaDatasource.mockResult = [
        {
          'id': 12345,
          'title': 'Test Song',
          'source': 'file:///path/to/test.mp3',
          'duration': 180000,
          'artistIds': <String>[],
          'albumId': null,
        }
      ];

      final result = await repository.scanMediaLibrary();

      expect(result, isA<SuccessResult<List<Song>>>());
      final success = result as SuccessResult<List<Song>>;
      expect(success.data.length, equals(1));
      expect(success.data.first.id, equals(12345));
      expect(success.data.first.title, equals('Test Song'));
      expect(success.data.first.source, equals(Uri.parse('file:///path/to/test.mp3')));
    });

    test('scanMediaLibrary should return SuccessResult with empty list when datasource is empty', () async {
      mediaDatasource.mockResult = [];

      final result = await repository.scanMediaLibrary();

      expect(result, isA<SuccessResult<List<Song>>>());
      final success = result as SuccessResult<List<Song>>;
      expect(success.data, isEmpty);
    });

    test('scanMediaLibrary should return FailureResult when datasource throws FileSystemException', () async {
      mediaDatasource.exceptionToThrow = FileSystemException();

      final result = await repository.scanMediaLibrary();

      expect(result, isA<FailureResult<List<Song>>>());
      final failureResult = result as FailureResult<List<Song>>;
      expect(failureResult.failure, isA<FileSystemFailure>());
    });
  });
}
