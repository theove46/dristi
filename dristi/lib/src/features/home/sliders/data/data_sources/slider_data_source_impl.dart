import 'package:dio/dio.dart';
import 'package:dristi/src/core/base/base_remote_source.dart';
import 'package:dristi/src/core/constants/app_end_points.dart';
import 'package:dristi/src/core/network/dio_provider.dart';
import 'package:dristi/src/features/home/sliders/data/data_sources/slider_data_source.dart';
import 'package:dristi/src/features/home/sliders/data/model/slider_response_model.dart';

class SliderDataSourceImp extends BaseRemoteSource implements SliderDataSource {
  @override
  Future<SliderResponseModel> sliderComponents() {
    final String endpoint = DioProvider.baseUrl + API.slider;

    final Future<Response> dioCall = dioClient.get(endpoint);

    try {
      return callApiWithErrorParser(dioCall).then((Response response) {
        return SliderResponseModel.fromJson(json: response.data);
      });
    } catch (e) {
      rethrow;
    }
  }
}
