import 'package:dio/dio.dart';
import 'package:dristi/src/core/base/base_remote_source.dart';
import 'package:dristi/src/core/constants/app_end_points.dart';
import 'package:dristi/src/core/network/dio_provider.dart';
import 'package:dristi/src/features/home/top_destinations/data/data_sources/top_destinations_data_source.dart';
import 'package:dristi/src/features/home/top_destinations/data/model/top_destinations_response_model.dart';

class TopDestinationsDataSourceImp extends BaseRemoteSource
    implements TopDestinationsDataSource {
  @override
  Future<TopDestinationsResponseModel> getTopDestinationsComponents() {
    final String endpoint = DioProvider.baseUrl + API.topDestinations;

    final Future<Response> dioCall = dioClient.get(endpoint);

    try {
      return callApiWithErrorParser(dioCall).then((Response response) {
        return TopDestinationsResponseModel.fromJson(json: response.data);
      });
    } catch (e) {
      rethrow;
    }
  }
}
