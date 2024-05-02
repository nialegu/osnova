part of "routes.dart";

final homeRoutes = StatefulShellBranch(
          initialLocation: "/home",
          routes: [
            GoRoute(
              path: "/home",
              name: "Home",
              builder: (context, state) => const HomeScreen(),
            ),
          ],
        );