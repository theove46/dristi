import 'package:dio/dio.dart';
import 'package:dristi/src/core/base/base_remote_source.dart';
import 'package:dristi/src/core/constants/app_end_points.dart';
import 'package:dristi/src/core/network/dio_provider.dart';
import 'package:dristi/src/features/accommodation/data/data_sources/accommodation_data_source.dart';
import 'package:dristi/src/features/accommodation/data/models/accommodation_response_model.dart';

class AccommodationDataSourceImp extends BaseRemoteSource
    implements AccommodationDataSource {
  @override
  Future<AccommodationResponseModel> getAccommodationData(
      String appLanguage, String spotId) {
    final String endpoint =
        '${DioProvider.baseUrl}${API.accommodation}${API.language}$appLanguage${'/hr0001.json'}';

    final Future<Response> dioCall = dioClient.get(endpoint);

    try {
      return callApiWithErrorParser(dioCall).then((Response response) {
        return AccommodationResponseModel.fromJson(json: response.data);
      });
    } catch (e) {
      rethrow;
    }
  }
}
