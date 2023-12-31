import 'package:dio/dio.dart';
import 'package:dristi/src/features/districts/data/data_sources/districts_data_source.dart';
import 'package:dristi/src/features/districts/data/models/district_components_model.dart';
import 'package:dristi/src/features/districts/data/models/district_response_model.dart';

class DistrictDataSourceImp implements DistrictDataSource {
  const DistrictDataSourceImp();

  @override
  Future<Response> districtComponents() async {
    List<DistrictsComponentsModel> districtComponents =
        DistrictsComponentsModel.fetchAllData();

    DistrictResponseModel response =
        DistrictResponseModel.fromDistrictComponentsModel(districtComponents);

    return Response(
      requestOptions: RequestOptions(),
      statusMessage: response.message,
      data: response.data,
    );
  }
}
