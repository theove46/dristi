import 'package:dio/dio.dart';
import 'package:dristi/src/core/base/base_remote_source.dart';
import 'package:dristi/src/core/constants/app_end_points.dart';
import 'package:dristi/src/core/network/dio_provider.dart';
import 'package:dristi/src/features/settings/data/data_sources/settings_data_sources.dart';
import 'package:dristi/src/features/settings/data/models/settings_response_model.dart';

class SettingsDataSourceImp extends BaseRemoteSource
    implements SettingsDataSource {
  @override
  Future<SettingsResponseModel> getSettingsComponents(String appLanguage) {
    final String endpoint =
        '${DioProvider.baseUrl}${API.components}${API.language}$appLanguage${API.settings}';

    final Future<Response> dioCall = dioClient.get(endpoint);

    try {
      return callApiWithErrorParser(dioCall).then((Response response) {
        return SettingsResponseModel.fromJson(json: response.data);
      });
    } catch (e) {
      rethrow;
    }
  }
}
