import 'package:dio/dio.dart';
import 'package:dristi/src/core/base/base_remote_source.dart';
import 'package:dristi/src/core/network/api_end_points.dart';
import 'package:dristi/src/core/network/dio_provider.dart';
import 'package:dristi/src/features/splash/data/data_sources/splash_data_source.dart';
import 'package:dristi/src/features/splash/data/models/splash_response_model.dart';

class SplashDataSourceImp extends BaseRemoteSource implements SplashDataSource {
  @override
  Future<SplashResponseModel> splashComponents() {
    final String endpoint = DioProvider.baseUrl + API.splash;

    final Future<Response> dioCall = dioClient.get(endpoint);

    try {
      return callApiWithErrorParser(dioCall).then((Response response) {
        return SplashResponseModel.fromJson(json: response.data);
      });
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Response> buttonSubmit() async {
    return Response(
      requestOptions: RequestOptions(),
      statusMessage: '',
    );
  }
}
