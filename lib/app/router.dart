import 'package:go_router/go_router.dart';

import 'package:drive_tunes/features/library/presentation/ui/pages/library_page.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (context, state) => const LibraryPage()),
  ],
);
