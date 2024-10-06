import 'package:dristi/src/features/settings/data/data_sources/settings_data_sources.dart';
import 'package:dristi/src/features/settings/data/repositories/settings_repositories_impl.dart';
import 'package:dristi/src/features/settings/domain/entities/settings_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final settingsRepositoryProvider = Provider<SettingsRepository>(
  (ref) {
    final dataSource = ref.read(settingsDataSourceProvider);
    return SettingsRepositoryImp(dataSource: dataSource);
  },
);

abstract class SettingsRepository {
  Future<SettingsEntity> getSettingsComponents(String appLanguage);
}
