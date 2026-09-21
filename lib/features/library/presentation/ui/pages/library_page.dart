import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:drive_tunes/features/library/presentation/providers/library_provider.dart';

class LibraryPage extends ConsumerWidget {
  const LibraryPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final libraryState = ref.watch(libraryProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text(
          'Biblioteca',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh, color: Colors.white),
            onPressed: () {
              final libraryNotifier = ref.read(libraryProvider.notifier);
              libraryNotifier.synchronize();
            },
          ),
        ],
      ),
      body: libraryState.when(
        skipError: true,
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => SizedBox.shrink(),
        data: (songs) => ListView.builder(
          itemCount: songs.length,
          itemBuilder: (_, index) {
            final song = songs[index];
            return ListTile(
              leading: CircleAvatar(
                child: Text(song.title.substring(0, 1).toUpperCase()),
              ),
              title: Text(song.title),
              trailing: IconButton(
                icon: Icon(Icons.play_circle_fill),
                onPressed: null,
              ),
            );
          },
        ),
      ),
    );
  }
}
