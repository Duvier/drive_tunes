import 'package:drive_tunes/features/player/presentation/ui/providers/player_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:drive_tunes/core/app_failures.dart';

class PlayerPage extends ConsumerWidget {
  const PlayerPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final playerState = ref.watch(playerProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Reproductor')),
      // body: playerState.when(
      //   loading: () => const Center(child: CircularProgressIndicator()),
      //   error: (error, stackTrace) {
      //     return switch (error) {
      //       PermissionFailure() => const Center(
      //         child: Text('Permisos denegados'),
      //       ),
      //       UnknownFailure(message: final message) => Center(
      //         child: Text(message),
      //       ),
      //       _ => const Center(child: Text('Error desconocido')),
      //     };
      //   },
      //   data: (song) => ListTile(
      //     title: Text('Acá debería estar la info de la canción'),
      //     trailing: IconButton(icon: Icon(Icons.play_arrow), onPressed: () {}),
      //   ),
      // ),
    );
  }
}
