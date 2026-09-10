import 'package:drive_tunes/core/app_failures.dart';
import 'package:drive_tunes/core/result.dart';
import 'package:drive_tunes/domain/entities/song.dart';
import 'package:drive_tunes/features/library/domain/repositories/library_repository.dart';
import 'package:drive_tunes/features/library/domain/usecases/get_songs_use_case.dart';
import 'package:drive_tunes/features/library/domain/value_objects/synchronization_result_value_object.dart';
import 'package:flutter_test/flutter_test.dart';

final class _FakeLibraryRepository implements LibraryRepository {
  Result<List<Song>>? resultToReturn;

  @override
  Future<Result<List<Song>>> getSongs() async {
    return resultToReturn ?? SuccessResult([]);
  }

  @override
  Future<Result<void>> deleteSongs(List<String> ids) async {
    return SuccessResult(null);
  }

  @override
  Future<Result<Song?>> getSong(String id) async {
    return SuccessResult(null);
  }

  @override
  Future<Result<void>> saveSongs(List<Song> songs) async {
    return SuccessResult(null);
  }

  @override
  Future<Result<List<Song>>> searchSong(String query) async {
    return SuccessResult([]);
  }

  @override
  Future<Result<void>> synchronize(
    SynchronizationResultValueObject changes,
  ) async {
    return SuccessResult(null);
  }
}

void main() {
  group('GetSongsUseCase', () {
    late _FakeLibraryRepository repository;
    late GetSongsUseCase useCase;

    setUp(() {
      repository = _FakeLibraryRepository();
      useCase = GetSongsUseCase(libraryRepository: repository);
    });

    test(
      'should return SuccessResult with songs when repository succeeds',
      () async {
        final expectedSongs = [
          Song(
            id: 1,
            title: 'Song 1',
            duration: const Duration(seconds: 200),
            source: Uri.parse('file:///path/1'),
          ),
        ];
        repository.resultToReturn = SuccessResult(expectedSongs);

        final result = await useCase();

        expect(result, isA<SuccessResult<List<Song>>>());
        final success = result as SuccessResult<List<Song>>;
        expect(success.data, equals(expectedSongs));
      },
    );

    test('should return FailureResult when repository fails', () async {
      final failure = UnknownFailure(message: 'Test failure');
      repository.resultToReturn = FailureResult(failure);

      final result = await useCase();

      expect(result, isA<FailureResult<List<Song>>>());
      final failureResult = result as FailureResult<List<Song>>;
      expect(failureResult.failure, equals(failure));
    });
  });
}
