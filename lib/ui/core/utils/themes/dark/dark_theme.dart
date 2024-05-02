import 'package:flutter/material.dart';

part "styles/text_styles.dart";
part "styles/text_theme.dart";

final darkTheme = ThemeData(
  fontFamily: "Montserrat",
  brightness: Brightness.dark,
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
  useMaterial3: true,
);
