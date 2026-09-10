import 'package:drive_tunes/core/result.dart';
import 'package:drive_tunes/domain/entities/song.dart';
import 'package:drive_tunes/features/player/domain/repositories/player_repository.dart';

class PlaySongUseCase {
  final PlayerRepository repository;

  PlaySongUseCase(this.repository);

  Future<Result<void>> call(Song song) async {
    return await repository.play(song);
  }
}
