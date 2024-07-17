import 'package:dristi/src/core/utils/enums.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'cache_service.dart';

class CacheServiceImpl implements CacheService {
  CacheServiceImpl();

  late Box box;

  static const String _appSettingsBox = 'appSettingsBox';
  static const String _themeBox = 'themeBox';
  static const String _languageBox = 'languageBox';
  static const String _favoritesBox = 'favoritesBox';

  static const String _isFirstTimeKey = 'isFirstTime';
  static const String _themeKey = 'theme';
  static const String _languageKey = 'language';
  static const String _favoritesKey = 'favorites';

  @override
  Future<void> setFirstTimeOnBoardingFalse() async {
    Hive.openBox(_appSettingsBox);
    final box = Hive.box<bool>(_appSettingsBox);
    await box.put(_isFirstTimeKey, false);
  }

  @override
  Future<bool> getFirstTimeOnBoardingStatus() async {
    final box = await Hive.openBox<bool>(_appSettingsBox);
    bool? isFirstTime = box.get(_isFirstTimeKey);
    return isFirstTime ?? true;
  }

  @override
  Future<void> setTheme(AppTheme theme) async {
    Hive.openBox(_themeBox);
    final box = await Hive.openBox<int>(_themeBox);
    await box.put(_themeKey, theme.index);
  }

  @override
  Future<AppTheme> getTheme() async {
    final box = await Hive.openBox<int>(_themeBox);
    int? themeIndex = box.get(_themeKey);
    return AppTheme.values[themeIndex ?? AppTheme.systemDefault.index];
  }

  @override
  Future<void> setLanguage(AppLanguages language) async {
    final box = await Hive.openBox<int>(_languageBox);
    await box.put(_languageKey, language.index);
  }

  @override
  Future<AppLanguages> getLanguage() async {
    final box = await Hive.openBox<int>(_languageBox);
    int? languageIndex = box.get(_languageKey);
    return AppLanguages.values[languageIndex ?? AppLanguages.bn.index];
  }

  @override
  Future<void> setFavouritesItemsList(Set<String> favoritesList) async {
    final box = await Hive.openBox<List<String>>(_favoritesBox);
    await box.put(_favoritesKey, favoritesList.toList());
  }

  @override
  Future<Set<String>> getFavouritesItemsList() async {
    final box = await Hive.openBox<List<String>>(_favoritesBox);
    List<String>? favoritesList = box.get(_favoritesKey);
    return favoritesList?.toSet() ?? {};
  }
}
