import 'package:dristi/src/features/splash/data/data_sources/splash_data_source.dart';
import 'package:dristi/src/features/splash/domain/entities/splash_entity.dart';
import 'package:dristi/src/features/splash/domain/repositories/splash_repository.dart';
import 'package:hive_flutter/hive_flutter.dart';

class SplashRepositoryImp implements SplashRepository {
  SplashRepositoryImp({
    required this.dataSource,
  });

  final SplashDataSource dataSource;
  late Box<bool> _settingsBox;
  static const String _boxName = 'appSettings';
  static const String _flagName = 'isFirstTime';

  Future<void> initHive() async {
    await Hive.openBox<bool>(_boxName);
    _settingsBox = Hive.box<bool>(_boxName);
  }

  @override
  Future<void> setFirstTime(bool value) async {
    await initHive();
    await _settingsBox.put(_flagName, value);
  }

  @override
  Future<List<SplashEntity>> getSplashComponents() async {
    final response = await dataSource.splashComponents();

    return response.splashItems;
  }

  @override
  Future<(String, dynamic)> buttonSubmit() async {
    final response = await dataSource.buttonSubmit();

    return Future.value((response.statusMessage!, true));
  }
}
