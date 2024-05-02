import 'package:go_router/go_router.dart';
import 'package:osnova/ui/core/routing/navigation_bar_routing.dart/chats_routes.dart';
import 'package:osnova/ui/core/routing/navigation_bar_routing.dart/home_routes.dart';
import 'package:osnova/ui/core/routing/navigation_bar_routing.dart/me_routes.dart';
import 'package:osnova/ui/core/routing/navigation_bar_routing.dart/parties_routes.dart';

import '../../base_screen.dart';

StatefulShellRoute get navigationBarRoutes => _shellRoutesForNavigationBar;

final _shellRoutesForNavigationBar = StatefulShellRoute.indexedStack(
  builder: (context, state, navigationShell) =>
      BaseScreen(navigationShell: navigationShell),
  branches: [
    homeRoutes,
    partiesRoutes,
    chatsRoutes,
    meRoutes,
  ],
);
