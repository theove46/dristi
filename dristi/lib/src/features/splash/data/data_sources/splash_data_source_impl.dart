import 'package:dio/dio.dart';
import 'package:dristi/src/features/splash/data/data_sources/splash_data_source.dart';
import 'package:dristi/src/features/splash/data/models/splash_components_model.dart';
import 'package:dristi/src/features/splash/data/models/splash_response_model.dart';

class SplashDataSourceImp implements SplashDataSource {
  const SplashDataSourceImp();

  @override
  Future<Response> splashComponents() async {
    List<SplashComponentsModel> splashComponents =
        SplashComponentsModel.fetchAllData();

    SplashResponseModel response =
        SplashResponseModel.fromSplashComponentsModel(splashComponents);

    return Response(
      requestOptions: RequestOptions(),
      statusMessage: response.message,
      data: response.data,
    );
  }

  @override
  Future<Response> buttonSubmit() async {
    return Response(
      requestOptions: RequestOptions(),
      statusMessage: '',
    );
  }
}
