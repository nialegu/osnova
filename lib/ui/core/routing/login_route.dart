import 'package:go_router/go_router.dart';
import 'package:osnova/ui/features/login/login_screen.dart';

final loginRoute = ShellRoute(
    builder: (context, state, child) {
      print(child);
      return child;
    },
    routes: [
      GoRoute(
        path: "/login",
        name: "Login",
        builder: (context, state) => const LoginScreen(),
      ),
    ]);
