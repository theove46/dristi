import 'package:dio/dio.dart';
import 'package:dristi/src/features/home/top_destinations/data/data_sources/top_destination_data_source.dart';
import 'package:dristi/src/features/home/top_destinations/data/model/top_destination_components_model.dart';
import 'package:dristi/src/features/home/top_destinations/data/model/top_destination_response_model.dart';

class TopDestinationDataSourceImp implements TopDestinationDataSource {
  const TopDestinationDataSourceImp();

  @override
  Future<Response> topDestinationComponents() async {
    List<TopDestinationComponentsModel> topDestinationComponents =
        TopDestinationComponentsModel.fetchAllData();

    TopDestinationResponseModel response =
        TopDestinationResponseModel.fromTopDestinationComponentsModel(
            topDestinationComponents);

    return Response(
      requestOptions: RequestOptions(),
      statusMessage: response.message,
      data: response.data,
    );
  }
}
