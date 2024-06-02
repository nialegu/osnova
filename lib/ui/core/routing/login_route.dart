import 'package:go_router/go_router.dart';
import '../../features/login/login_screen.dart';

final loginRoute =
    ShellRoute(builder: (context, state, child) => child, routes: [
  GoRoute(
    path: "/login",
    name: "Login",
    builder: (context, state) => LoginScreen(),
  ),
]);
