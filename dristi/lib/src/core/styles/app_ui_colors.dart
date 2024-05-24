import 'package:dristi/src/core/styles/colors_scheme.dart';
import 'package:flutter/material.dart';

class AppUIColors {
  static const Color _primaryLight = Color(0xFF086972);
  static const Color _primaryDark = Color(0xFF17b978);
  static const Color _secondaryLight = Color(0xff333333);
  static const Color _secondaryDark = Color(0xFF001f3f);
  static const Color _tertiaryLight = Color(0xFFFFFFFF);
  static const Color _tertiaryDark = Color(0xFFdaeaf6);
  static const Color _errorLight = Color(0xffEA5455);
  static const Color _errorDark = Color(0xffEA5455);

  static Color primary(BuildContext context) {
    return Theme.of(context).colorScheme == lightColorScheme
        ? _primaryLight
        : _primaryDark;
  }

  static Color secondary(BuildContext context) {
    return Theme.of(context).colorScheme == lightColorScheme
        ? _secondaryLight
        : _secondaryDark;
  }

  static Color tertiary(BuildContext context) {
    return Theme.of(context).colorScheme == lightColorScheme
        ? _tertiaryLight
        : _tertiaryDark;
  }

  static Color error(BuildContext context) {
    return Theme.of(context).colorScheme == lightColorScheme
        ? _errorLight
        : _errorDark;
  }
}
