import 'package:dristi/src/features/splash/data/data_sources/splash_data_source.dart';
import 'package:dristi/src/features/splash/data/repositories/splash_repository_impl.dart';
import 'package:dristi/src/features/splash/domain/entities/splash_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final splashRepositoryProvider = Provider<SplashRepository>(
  (ref) {
    final dataSource = ref.read(splashDataSourceProvider);
    return SplashRepositoryImp(dataSource: dataSource);
  },
);

abstract class SplashRepository {
  Future<void> setFirstTimeStatusFalse();

  Future<bool> getFirstTimeStatus();

  Future<List<SplashEntity>> getSplashComponents();

  Future<(String, dynamic)> buttonSubmit();
}
