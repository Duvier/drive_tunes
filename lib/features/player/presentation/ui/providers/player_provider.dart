import 'package:drive_tunes/core/app_failures.dart';
import 'package:drive_tunes/domain/entities/song.dart';
import 'package:drive_tunes/features/player/domain/usecases/play_song_use_case.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:drive_tunes/core/dependency_injector.dart';
import 'package:drive_tunes/core/result.dart';
import 'package:hooks_riverpod/misc.dart';

final playerProvider = AsyncNotifierProvider.family<PlayerNotifier, void, Song>(
  (song) =>
      PlayerNotifier(playSongUseCase: serviceContainer<PlaySongUseCase>()),
);

final class PlayerNotifier extends AsyncNotifier<Song> {
  final PlaySongUseCase _playSongUseCase;

  PlayerNotifier({required this._playSongUseCase});

  @override
  Future<Song> build() async {
    throw UnimplementedError();
    // final result = await _playSongUseCase(song);
    // switch (result) {
    //   case Success(value: final song):
    //     state = AsyncData(song);
    //   case Failure(:final error):
    //     state = AsyncError(error, StackTrace.current);
    // }
  }
}
