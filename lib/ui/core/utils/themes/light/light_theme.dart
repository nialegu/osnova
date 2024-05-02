import 'package:flutter/material.dart';

part 'styles/text_theme.dart';
part 'styles/text_styles.dart';

final lightTheme = ThemeData(
  useMaterial3: true,
  fontFamily: "Montserrat",
  brightness: Brightness.light,
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
  textTheme: createLightTextTheme,
);
