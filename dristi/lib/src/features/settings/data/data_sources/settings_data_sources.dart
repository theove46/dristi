import 'package:dristi/src/features/settings/data/data_sources/settings_data_sources_impl.dart';
import 'package:dristi/src/features/settings/data/models/settings_response_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final settingsDataSourceProvider = Provider<SettingsDataSource>(
  (ref) {
    return SettingsDataSourceImp();
  },
);

abstract class SettingsDataSource {
  Future<SettingsResponseModel> getSettingsComponents(String appLanguage);
}
