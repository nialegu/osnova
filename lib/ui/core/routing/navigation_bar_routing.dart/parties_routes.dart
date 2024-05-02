import 'package:go_router/go_router.dart';
import 'package:osnova/ui/features/home/home_screen.dart';

StatefulShellBranch get partiesRoutes => _partiesRoutes;

final _partiesRoutes = StatefulShellBranch(
          initialLocation: "/parties",
          routes: [
            GoRoute(
              path: "/parties",
              name: "Parties",
              builder: (context, state) => const HomeScreen(),
            ),
          ],
        );