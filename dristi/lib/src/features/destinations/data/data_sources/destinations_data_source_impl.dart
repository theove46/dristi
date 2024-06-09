import 'package:dio/dio.dart';
import 'package:dristi/src/core/base/base_remote_source.dart';
import 'package:dristi/src/core/constants/app_end_points.dart';
import 'package:dristi/src/core/network/dio_provider.dart';
import 'package:dristi/src/features/destinations/data/data_sources/destinations_data_source.dart';
import 'package:dristi/src/features/destinations/data/models/destination_response_model.dart';

class DestinationsDataSourceImp extends BaseRemoteSource
    implements DestinationsDataSource {
  @override
  Future<DestinationsResponseModel> destinationsComponents() {
    final String endpoint = DioProvider.baseUrl + API.destinations;

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
