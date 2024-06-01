import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'cache_service_impl.dart';

final cacheServiceProvider = Provider<CacheService>(
  (ref) => CacheServiceImpl(),
);

abstract class CacheService {
  Future<void> init();

  Future<void> setFirstTimeOnBoardingFalse();

  Future<bool> getFirstTimeStatus();
}
