import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:osnova/ui/core/app.dart';
import 'package:osnova/ui/core/base_screen.dart';
import 'package:osnova/ui/features/home/home_screen.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();
final shellNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: rootNavigatorKey,
  initialLocation: "/home",
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return BaseScreen(
          navigationShell: navigationShell,
        );
      },
      branches: [
        StatefulShellBranch(
          initialLocation: "/home",
          routes: [
            GoRoute(
              path: "/home",
              name: "Home",
              builder: (context, state) => const HomeScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: "/2",
              name: "2",
              builder: (context, state) => const App(),
            ),
            GoRoute(
              path: "/1",
              name: "1",
              builder: (context, state) => const HomeScreen(),
            ),
          ],
        ),
      ],
    )
  ],
);
