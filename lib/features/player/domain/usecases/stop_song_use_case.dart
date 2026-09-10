import 'package:drive_tunes/core/result.dart';
import 'package:drive_tunes/features/player/domain/repositories/player_repository.dart';

class StopSongUseCase {
  final PlayerRepository repository;

  StopSongUseCase(this.repository);

  Future<Result<void>> call() async {
    return await repository.stop();
  }
}
