import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:osnova/ui/core/routing/base_routes.dart';
import 'package:osnova/ui/core/utils/themes/dark/dark_theme.dart';
import 'package:osnova/ui/core/utils/themes/light/light_theme.dart';

import '../../generated/l10n.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,

      // Навигация
      routerConfig: router,

      // Тема
      theme: lightTheme,
      darkTheme: darkTheme,
      themeAnimationDuration: Durations.long2,
      themeAnimationCurve: Curves.bounceIn,

      // Локализация
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      //locale: const Locale("ru"),
      supportedLocales: S.delegate.supportedLocales,
    );
  }
}
