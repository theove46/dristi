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

enum SpotScreenType {
  detailsScreen,
  hotelsScreen,
  nearestScreen,
  seasonsScreen,
  specialsScreen,
  cautionsScreen,
  blogsScreen,
}

List<Locale> get supportedLanguages => AppLanguages.values
    .map((AppLanguages language) => language.toLanguage)
    .toList();
