import 'package:dristi/src/features/splash/data/data_sources/splash_data_source.dart';
import 'package:dristi/src/features/splash/domain/entities/splash_entity.dart';
import 'package:dristi/src/features/splash/domain/repositories/splash_repository.dart';

class SplashRepositoryImp implements SplashRepository {
  const SplashRepositoryImp({
    required this.dataSource,
  });

  final SplashDataSource dataSource;

  @override
  Future<(String, List<SplashEntity>?)> getSplashComponents() async {
    final response = await dataSource.splashComponents();

    return Future.value(
        (response.statusMessage!, response.data as List<SplashEntity>?));
  }

  @override
  Future<(String, dynamic)> buttonSubmit() async {
    final response = await dataSource.buttonSubmit();

    return Future.value((response.statusMessage!, true));
  }
}
