import 'package:dio/dio.dart';
import 'package:dristi/src/core/base/base_remote_source.dart';
import 'package:dristi/src/core/constants/app_end_points.dart';
import 'package:dristi/src/core/network/dio_provider.dart';
import 'package:dristi/src/features/destinations_list/data/models/destinations_list_response_model.dart';
import 'package:dristi/src/features/home/sliders/data/data_sources/slider_data_source.dart';

class SliderDataSourceImp extends BaseRemoteSource implements SliderDataSource {
  @override
  Future<DestinationsListResponseModel> sliderComponents(String appLanguage) {
    final String endpoint =
        '${DioProvider.baseUrl}${API.components}${API.language}$appLanguage${API.slider}';

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
