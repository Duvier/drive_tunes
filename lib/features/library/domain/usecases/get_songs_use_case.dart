import 'package:drive_tunes/core/result.dart';
import 'package:drive_tunes/domain/entities/song.dart';
import 'package:drive_tunes/features/library/domain/repositories/library_repository.dart';

final class GetSongsUseCase {
  final LibraryRepository libraryRepository;

  const GetSongsUseCase({required this.libraryRepository});

  Future<Result<List<Song>>> call() async {
    return await libraryRepository.getSongs();
  }
}
