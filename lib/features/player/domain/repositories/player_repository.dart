import 'package:drive_tunes/core/result.dart';
import 'package:drive_tunes/domain/entities/song.dart';

abstract class PlayerRepository {
  Future<Result<void>> play(Song song);
  Future<Result<void>> pause();
  Future<Result<void>> resume();
  Future<Result<void>> stop();
}
