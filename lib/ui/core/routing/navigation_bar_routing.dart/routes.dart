import 'package:go_router/go_router.dart';

import '/ui/features/home/home_screen.dart';
import '../../base_screen.dart';

part "home_routes.dart";
part "parties_routes.dart";
part "chats_routes.dart";
part "me_routes.dart";

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
