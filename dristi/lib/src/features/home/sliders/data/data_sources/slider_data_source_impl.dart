import 'package:dio/dio.dart';
import 'package:dristi/src/core/base/base_remote_source.dart';
import 'package:dristi/src/core/constants/app_end_points.dart';
import 'package:dristi/src/core/network/dio_provider.dart';
import 'package:dristi/src/features/destinations/data/models/destination_response_model.dart';
import 'package:dristi/src/features/home/sliders/data/data_sources/slider_data_source.dart';

class SliderDataSourceImp extends BaseRemoteSource implements SliderDataSource {
  @override
  Future<DestinationsResponseModel> sliderComponents() {
    final String endpoint = DioProvider.baseUrl + API.slider;

    final Future<Response> dioCall = dioClient.get(endpoint);

    try {
      return callApiWithErrorParser(dioCall).then((Response response) {
        return DestinationsResponseModel.fromJson(json: response.data);
      });
    } catch (e) {
      rethrow;
    }
  }
}
