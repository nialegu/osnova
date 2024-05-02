import 'package:go_router/go_router.dart';
import 'package:osnova/ui/features/home/home_screen.dart';

StatefulShellBranch get meRoutes => _meRoutes;

final _meRoutes = StatefulShellBranch(
          initialLocation: "/me",
          routes: [
            GoRoute(
              path: "/me",
              name: "Me",
              builder: (context, state) => const HomeScreen(),
            ),
          ],
        );