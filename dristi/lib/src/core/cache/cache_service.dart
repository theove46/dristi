import 'package:dristi/l10n/localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'cache_service_impl.dart';

final cacheServiceProvider = Provider<CacheService>(
  (ref) => CacheServiceImpl(),
);

abstract class CacheService {
  Future<void> setFirstTimeOnBoardingFalse();

  Future<bool> getFirstTimeOnBoardingStatus();

  Future<void> setTheme(AppTheme theme);

  Future<AppTheme> getTheme();

  Future<void> setLanguage(AppLanguages language);

  Future<AppLanguages> getLanguage();
}
