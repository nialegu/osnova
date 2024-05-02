import 'package:go_router/go_router.dart';
import 'package:osnova/ui/features/home/home_screen.dart';

StatefulShellBranch get homeRoutes => _homeRoutes;

final _homeRoutes = StatefulShellBranch(
          initialLocation: "/home",
          routes: [
            GoRoute(
              path: "/home",
              name: "Home",
              builder: (context, state) => const HomeScreen(),
            ),
          ],
        );