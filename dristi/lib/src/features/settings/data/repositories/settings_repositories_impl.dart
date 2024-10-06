import 'package:dristi/src/features/settings/data/data_sources/settings_data_sources.dart';
import 'package:dristi/src/features/settings/domain/entities/settings_entity.dart';
import 'package:dristi/src/features/settings/domain/repositories/settings_repositories.dart';

class SettingsRepositoryImp implements SettingsRepository {
  const SettingsRepositoryImp({
    required this.dataSource,
  });

  final SettingsDataSource dataSource;

  @override
  Future<SettingsEntity> getSettingsComponents(String appLanguage) async {
    final response = await dataSource.getSettingsComponents(appLanguage);

    return response.settingsEntity;
  }
}
