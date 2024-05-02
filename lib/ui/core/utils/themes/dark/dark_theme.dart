import 'package:flutter/material.dart';

part "styles/text_styles.dart";
part "styles/text_theme.dart";

final darkTheme = ThemeData(
  useMaterial3: true,
  fontFamily: "Montserrat",
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
  textTheme: createDarkTextTheme,
);
