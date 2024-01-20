import 'package:dristi/src/features/home/data/model/top_destinations/top_destination_components_model.dart';
import 'package:dristi/src/features/home/domain/entities/top_destination_entity.dart';

class TopDestinationResponseModel<T> {
  TopDestinationResponseModel({
    required this.message,
    required this.data,
  });

  final String message;
  final List<TopDestinationEntity> data;

  factory TopDestinationResponseModel.fromTopDestinationComponentsModel(
      List<TopDestinationComponentsModel> topDestinationComponents) {
    List<TopDestinationEntity> convertedData = topDestinationComponents
        .map((topDestinationModel) => TopDestinationEntity(
              title: topDestinationModel.title.toString(),
              image: topDestinationModel.image.toString(),
            ))
        .toList();

    return TopDestinationResponseModel(
      message: '',
      data: convertedData,
    );
  }
}
