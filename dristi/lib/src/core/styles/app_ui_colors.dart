import 'package:dristi/src/core/styles/colors_scheme.dart';
import 'package:flutter/material.dart';

class AppUIColors {
  static const Color _lightPrimaryTextColor = Color(0xFF086972);
  static const Color _darkPrimaryTextColor = Color(0xFF17b978);
  static const Color _lightSecondaryTextColor = Color(0xff333333);
  static const Color _darkSecondaryTextColor = Color(0xFF001f3f);
  static const Color _lightTertiaryTextColor = Color(0xFFFFFFFF);
  static const Color _darkTertiaryTextColor = Color(0xFFdaeaf6);
  static const Color _lightErrorTextColor = Color(0xffEA5455);
  static const Color _darkErrorTextColor = Color(0xffEA5455);

  static Color primaryTextColor(BuildContext context) {
    return Theme.of(context).colorScheme == lightColorScheme
        ? _lightPrimaryTextColor
        : _darkPrimaryTextColor;
  }

  static Color secondaryTextColor(BuildContext context) {
    return Theme.of(context).colorScheme == lightColorScheme
        ? _lightSecondaryTextColor
        : _darkSecondaryTextColor;
  }

  static Color tertiaryTextColor(BuildContext context) {
    return Theme.of(context).colorScheme == lightColorScheme
        ? _lightTertiaryTextColor
        : _darkTertiaryTextColor;
  }

  static Color errorTextColor(BuildContext context) {
    return Theme.of(context).colorScheme == lightColorScheme
        ? _lightErrorTextColor
        : _darkErrorTextColor;
  }
}
