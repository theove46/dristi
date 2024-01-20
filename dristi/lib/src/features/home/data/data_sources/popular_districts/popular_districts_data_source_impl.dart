import 'package:dio/dio.dart';
import 'package:dristi/src/features/home/data/data_sources/popular_districts/popular_districts_data_source.dart';
import 'package:dristi/src/features/home/data/model/popular_districts/popular_districts_components_model.dart';
import 'package:dristi/src/features/home/data/model/popular_districts/popular_districts_response_model.dart';

class PopularDistrictDataSourceImp implements PopularDistrictDataSource {
  const PopularDistrictDataSourceImp();

  @override
  Future<Response> popularDistrictComponents() async {
    List<PopularDistrictsComponentsModel> popularDistrictComponents =
        PopularDistrictsComponentsModel.fetchAllData();

    PopularDistrictResponseModel response =
        PopularDistrictResponseModel.fromPopularDistrictComponentsModel(
            popularDistrictComponents);

    return Response(
      requestOptions: RequestOptions(),
      statusMessage: response.message,
      data: response.data,
    );
  }
}
