import 'package:dio/dio.dart';
import 'package:dristi/src/features/spot/data/data_sources/spot_items_data_source.dart';
import 'package:dristi/src/features/spot/data/models/spot_items_components_model.dart';
import 'package:dristi/src/features/spot/data/models/spot_items_response_model.dart';

class SpotItemsDataSourceImp implements SpotItemsDataSource {
  const SpotItemsDataSourceImp();

  @override
  Future<Response> spotItemsComponents() async {
    List<SpotItemComponentsModel> spotItemComponents =
        SpotItemComponentsModel.fetchAllData();

    SpotItemResponseModel response =
        SpotItemResponseModel.fromSpotItemComponentsModel(spotItemComponents);

    return Response(
      requestOptions: RequestOptions(),
      statusMessage: response.message,
      data: response.data,
    );
  }
}
