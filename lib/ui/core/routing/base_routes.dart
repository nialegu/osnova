import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:osnova/ui/core/routing/navigation_bar_routing.dart/routes.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: rootNavigatorKey,
  initialLocation: "/home",
  routes: [
    navigationBarRoutes,
  ],
);
