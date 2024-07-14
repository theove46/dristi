import 'package:dio/dio.dart';
import 'package:dristi/src/core/base/base_remote_source.dart';
import 'package:dristi/src/core/constants/app_end_points.dart';
import 'package:dristi/src/core/network/dio_provider.dart';
import 'package:dristi/src/features/accommodations_list/data/data_sources/accommodations_list_data_source.dart';
import 'package:dristi/src/features/accommodations_list/data/models/accommodations_list_response_model.dart';

class AccommodationsListDataSourceImp extends BaseRemoteSource
    implements AccommodationsListDataSource {
  @override
  Future<AccommodationsListResponseModel> getAccommodationsListComponents(
      String appLanguage) {
    final String endpoint =
        '${DioProvider.baseUrl}${API.components}${API.language}$appLanguage${API.accommodationsList}';

    final Future<Response> dioCall = dioClient.get(endpoint);

    try {
      return callApiWithErrorParser(dioCall).then((Response response) {
        return AccommodationsListResponseModel.fromJson(json: response.data);
      });
    } catch (e) {
      rethrow;
    }
  }
}
