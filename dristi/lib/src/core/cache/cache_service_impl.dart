import 'package:hive_flutter/hive_flutter.dart';

import 'cache_service.dart';

class CacheServiceImpl implements CacheService {
  CacheServiceImpl();

  late Box box;

  static const String _boxName = 'appSettings';
  static const String _isFirstTimeFlagName = 'isFirstTime';

  @override
  Future<void> init() async {
    await Hive.initFlutter();
  }

  @override
  Future<void> setFirstTimeOnBoardingFalse() async {
    Hive.openBox(_boxName);
    box = Hive.box<bool>(_boxName);
    await box.put(_isFirstTimeFlagName, false);
  }

  @override
  Future<bool> getFirstTimeStatus() async {
    final box = await Hive.openBox<bool>(_boxName);
    bool? isFirstTime = box.get(_isFirstTimeFlagName);
    return isFirstTime ?? true;
  }
}
