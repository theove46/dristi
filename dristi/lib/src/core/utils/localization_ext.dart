import 'package:dristi/src/core/utils/enums.dart';
import 'package:dristi/src/core/styles/themes/app_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';

extension AppLanguageExtension on AppLanguages {
  Locale get toLanguage => Locale(name);
}

extension LocalizationExtension on BuildContext {
  AppLocalizations get localization => AppLocalizations.of(this)!;
}

ThemeData getLightThemeData(AppTheme themeType) {
  switch (themeType) {
    case AppTheme.systemDefault:
      return AppThemeData.lightTheme;
    case AppTheme.light:
      return AppThemeData.lightTheme;
    case AppTheme.dark:
      return AppThemeData.darkTheme;
    default:
      return AppThemeData.lightTheme;
  }
}

ThemeData getDarkThemeData(AppTheme themeType) {
  switch (themeType) {
    case AppTheme.systemDefault:
      return AppThemeData.darkTheme;
    case AppTheme.light:
      return AppThemeData.lightTheme;
    case AppTheme.dark:
      return AppThemeData.darkTheme;
    default:
      return AppThemeData.darkTheme;
  }
}
