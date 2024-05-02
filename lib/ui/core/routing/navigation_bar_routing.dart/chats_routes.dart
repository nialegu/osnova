import 'package:go_router/go_router.dart';
import 'package:osnova/ui/features/home/home_screen.dart';

StatefulShellBranch get chatsRoutes => _chatsRoutes;

final _chatsRoutes = StatefulShellBranch(
          initialLocation: "/chats",
          routes: [
            GoRoute(
              path: "/chats",
              name: "Chats",
              builder: (context, state) => const HomeScreen(),
            ),
          ],
        );