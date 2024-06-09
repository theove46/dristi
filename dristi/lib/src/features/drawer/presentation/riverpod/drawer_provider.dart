import 'package:dristi/l10n/localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final themeProvider = StateProvider<AppTheme>(
  (ref) => AppTheme.systemDefault,
  name: 'themeProvider',
);

final languageProvider = StateProvider<AppLanguages>(
  (ref) => AppLanguages.en,
  name: 'languageProvider',
);
