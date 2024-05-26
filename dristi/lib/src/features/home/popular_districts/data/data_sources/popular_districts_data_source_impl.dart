import 'package:dio/dio.dart';
import 'package:dristi/src/core/base/base_remote_source.dart';
import 'package:dristi/src/core/constants/app_end_points.dart';
import 'package:dristi/src/core/network/dio_provider.dart';
import 'package:dristi/src/features/home/popular_districts/data/data_sources/popular_districts_data_source.dart';
import 'package:dristi/src/features/home/popular_districts/data/model/popular_districts_response_model.dart';

class PopularDistrictDataSourceImp extends BaseRemoteSource
    implements PopularDistrictDataSource {
  @override
  Future<PopularDistrictsResponseModel> popularDistrictComponents() {
    final String endpoint = DioProvider.baseUrl + API.popularDistricts;

    final Future<Response> dioCall = dioClient.get(endpoint);

    try {
      return callApiWithErrorParser(dioCall).then((Response response) {
        return PopularDistrictsResponseModel.fromJson(json: response.data);
      });
    } catch (e) {
      rethrow;
    }
  }
}
