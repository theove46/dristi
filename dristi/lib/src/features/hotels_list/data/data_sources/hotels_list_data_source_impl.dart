import 'package:dio/dio.dart';
import 'package:dristi/src/core/base/base_remote_source.dart';
import 'package:dristi/src/core/constants/app_end_points.dart';
import 'package:dristi/src/core/network/dio_provider.dart';
import 'package:dristi/src/features/hotels_list/data/data_sources/hotels_list_data_source.dart';
import 'package:dristi/src/features/hotels_list/data/models/hotels_list_response_model.dart';

class HotelsListDataSourceImp extends BaseRemoteSource
    implements HotelsListDataSource {
  @override
  Future<HotelsListResponseModel> getHotelsListComponents(String appLanguage) {
    final String endpoint =
        '${DioProvider.baseUrl}${API.components}${API.language}$appLanguage${API.accommodationsList}';

    final Future<Response> dioCall = dioClient.get(endpoint);

    try {
      return callApiWithErrorParser(dioCall).then((Response response) {
        return HotelsListResponseModel.fromJson(json: response.data);
      });
    } catch (e) {
      rethrow;
    }
  }
}
