import 'package:dristi/src/core/utils/localization_ext.dart';
import 'package:flutter/material.dart';

enum AppLanguages {
  en,
  bn,
}

enum AppTheme {
  systemDefault,
  dark,
  light,
}

enum DestinationFilters {
  category,
  district,
}

enum DestinationScreenItemType {
  detailsScreen,
  hotelsScreen,
  nearestScreen,
  seasonsScreen,
  specialsScreen,
  cautionsScreen,
  blogsScreen,
}

enum BottomNavItems {
  home,
  destinations,
  settings,
}

List<Locale> get supportedLanguages => AppLanguages.values
    .map((AppLanguages language) => language.toLanguage)
    .toList();
