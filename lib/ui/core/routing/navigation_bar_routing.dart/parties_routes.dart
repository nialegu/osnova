part of "routes.dart";

final partiesRoutes = StatefulShellBranch(
          initialLocation: "/parties",
          routes: [
            GoRoute(
              path: "/parties",
              name: "Parties",
              builder: (context, state) => const HomeScreen(),
            ),
          ],
        );