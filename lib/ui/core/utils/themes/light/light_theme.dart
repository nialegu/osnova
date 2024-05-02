import 'package:flutter/material.dart';
import 'package:osnova/ui/core/utils/app_colors.dart';

part 'styles/text_theme.dart';
part 'styles/text_styles.dart';

final lightTheme = ThemeData(
  useMaterial3: true,
  fontFamily: "Montserrat",
  colorScheme: ColorScheme.fromSeed(seedColor: AppColors.deepPurple),
  textTheme: createLightTextTheme,
  elevatedButtonTheme: const ElevatedButtonThemeData(
    style: ButtonStyle(
      textStyle: MaterialStatePropertyAll(buttonTextStyle),
      backgroundColor: MaterialStatePropertyAll(AppColors.deepPurple),
      foregroundColor: MaterialStatePropertyAll(AppColors.white),
      enableFeedback: true,
      animationDuration: Duration(milliseconds: 500),
    ),
  ),
);
