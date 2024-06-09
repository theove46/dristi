import 'package:dio/dio.dart';
import 'package:dristi/src/core/base/base_remote_source.dart';
import 'package:dristi/src/core/constants/app_end_points.dart';
import 'package:dristi/src/core/network/dio_provider.dart';
import 'package:dristi/src/features/home/advertisements/data/data_sources/advertisement_data_source.dart';
import 'package:dristi/src/features/home/advertisements/data/model/advertisement_response_model.dart';

class AdvertisementDataSourceImp extends BaseRemoteSource
    implements AdvertisementDataSource {
  @override
  Future<SingleAdvertisementResponseModel> getSingleAdvertisementComponents() {
    final String endpoint = DioProvider.baseUrl + API.singleAdvertisement;
    final Future<Response> dioCall = dioClient.get(endpoint);
    try {
      return callApiWithErrorParser(dioCall).then((Response response) {
        return SingleAdvertisementResponseModel.fromJson(json: response.data);
      });
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<MultipleAdvertisementResponseModel>
      getMultipleAdvertisementComponents() {
    final String endpoint = DioProvider.baseUrl + API.multipleAdvertisement;
    final Future<Response> dioCall = dioClient.get(endpoint);
    try {
      return callApiWithErrorParser(dioCall).then((Response response) {
        return MultipleAdvertisementResponseModel.fromJson(json: response.data);
      });
    } catch (e) {
      rethrow;
    }
  }
}
