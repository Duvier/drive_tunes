import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

import 'package:drive_tunes/features/library/presentation/ui/pages/library_page.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: rootNavigatorKey,
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (context, state) => const LibraryPage()),
  ],
);
