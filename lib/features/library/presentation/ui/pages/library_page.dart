import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:drive_tunes/features/library/presentation/providers/library_provider.dart';
import 'package:drive_tunes/core/app_failures.dart';

class LibraryPage extends ConsumerWidget {
  const LibraryPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final libraryState = ref.watch(libraryProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Biblioteca'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              final libraryNotifier = ref.read(libraryProvider.notifier);
              libraryNotifier.synchronize();
            },
          ),
        ],
      ),
      body: libraryState.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) {
          return switch (error) {
            PermissionFailure() => const Center(
              child: Text('Permisos denegados'),
            ),
            FileSystemFailure() => const Center(
              child: Text('Error al acceder a los archivos'),
            ),
            SynchronizationFailure() => const Center(
              child: Text(
                'Error al sincronizar la biblioteca de música del dispositivo',
              ),
            ),
            UnknownFailure(message: final message) => Center(
              child: Text(message),
            ),
            _ => const Center(child: Text('Error desconocido')),
          };
        },
        data: (songs) => ListView.builder(
          itemCount: songs.length,
          itemBuilder: (_, index) {
            final song = songs[index];
            return ListTile(title: Text(song.title));
          },
        ),
      ),
    );
  }
}
