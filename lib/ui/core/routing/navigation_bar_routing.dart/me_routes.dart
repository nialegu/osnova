part of "routes.dart";

final meRoutes = StatefulShellBranch(
          initialLocation: "/me",
          routes: [
            GoRoute(
              path: "/me",
              name: "Me",
              builder: (context, state) => const HomeScreen(),
            ),
          ],
        );