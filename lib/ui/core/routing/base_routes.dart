import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'login_route.dart';
import 'navigation_bar_routing.dart/routes.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: rootNavigatorKey,
  initialLocation: "/login",
  routes: [
    navigationBarRoutes,
    loginRoute,
  ],
);
