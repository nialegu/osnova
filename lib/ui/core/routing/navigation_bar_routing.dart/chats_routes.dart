part of "routes.dart";

final chatsRoutes = StatefulShellBranch(
          initialLocation: "/chats",
          routes: [
            GoRoute(
              path: "/chats",
              name: "Chats",
              builder: (context, state) => const HomeScreen(),
            ),
          ],
        );