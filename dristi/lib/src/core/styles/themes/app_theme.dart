import 'package:dristi/src/core/styles/themes/icon_theme.dart';
import 'package:dristi/src/core/styles/themes/outlined_button_theme.dart';
import 'package:dristi/src/core/styles/themes/app_bar_theme.dart';
import 'package:dristi/src/core/styles/colors_scheme.dart';
import 'package:dristi/src/core/styles/themes/elevated_button_theme.dart';
import 'package:dristi/src/core/styles/texts.dart';
import 'package:dristi/src/core/styles/themes/card_theme.dart';
import 'package:dristi/src/core/styles/themes/divider_theme.dart';
import 'package:flutter/material.dart';

class AppThemeData {
  static ThemeData get lightTheme => _lightTheme;

  static ThemeData get darkTheme => _darkTheme;

  static final ThemeData _lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: lightColorScheme,
    scaffoldBackgroundColor: lightColorScheme.surface,
    fontFamily: FontFamily.nova,
    focusColor: lightColorScheme.primary,
    brightness: Brightness.light,
    appBarTheme: CustomAppBarTheme(scheme: lightColorScheme),
    dividerTheme: CustomDividerTheme(scheme: lightColorScheme),
    cardTheme: CustomCardTheme(scheme: lightColorScheme),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: CustomElevatedButtonTheme(scheme: lightColorScheme),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: CustomOutlinedButtonTheme(scheme: lightColorScheme),
    ),
    iconTheme: CustomIconTheme(scheme: lightColorScheme),
  );

  static final ThemeData _darkTheme = ThemeData(
    useMaterial3: true,
    colorScheme: darkColorScheme,
    fontFamily: FontFamily.nova,
    scaffoldBackgroundColor: darkColorScheme.surface,
    focusColor: darkColorScheme.primary,
    brightness: Brightness.dark,
    appBarTheme: CustomAppBarTheme(scheme: darkColorScheme),
    dividerTheme: CustomDividerTheme(scheme: darkColorScheme),
    cardTheme: CustomCardTheme(scheme: darkColorScheme),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: CustomElevatedButtonTheme(scheme: darkColorScheme),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: CustomOutlinedButtonTheme(scheme: darkColorScheme),
    ),
    iconTheme: CustomIconTheme(scheme: darkColorScheme),
  );
}
