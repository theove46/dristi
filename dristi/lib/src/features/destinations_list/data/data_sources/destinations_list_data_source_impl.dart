import 'package:dio/dio.dart';
import 'package:dristi/src/core/base/base_remote_source.dart';
import 'package:dristi/src/core/constants/app_end_points.dart';
import 'package:dristi/src/core/network/dio_provider.dart';
import 'package:dristi/src/features/destinations_list/data/data_sources/destinations_list_data_source.dart';
import 'package:dristi/src/features/destinations_list/data/models/destinations_list_response_model.dart';

class DestinationsListDataSourceImp extends BaseRemoteSource
    implements DestinationsListDataSource {
  @override
  Future<DestinationsListResponseModel> getDestinationsListComponents(
      String appLanguage) {
    final String endpoint =
        '${DioProvider.baseUrl}${API.components}${API.language}$appLanguage${API.destinationsList}';

    final Future<Response> dioCall = dioClient.get(endpoint);

    try {
      return callApiWithErrorParser(dioCall).then((Response response) {
        return DestinationsListResponseModel.fromJson(json: response.data);
      });
    } catch (e) {
      rethrow;
    }
  }
}
