import 'package:dristi/l10n/localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';

extension AppLanguageExtension on AppLanguages {
  Locale get toLocale => Locale(name);
}

extension LocalizationExtension on BuildContext {
  AppLocalizations get localization => AppLocalizations.of(this)!;
}
