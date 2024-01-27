import 'package:dristi/src/features/home/top_destinations/domain/entity/top_destination_entity.dart';

class TopDestinationResponseModel<T> {
  TopDestinationResponseModel({
    required this.message,
    required this.data,
  });

  final String message;
  final List<TopDestinationEntity> data;

  factory TopDestinationResponseModel.fromJson(List<dynamic> jsonList) {
    List<TopDestinationEntity> convertedData = jsonList
        .map((json) => TopDestinationEntity(
              title: json['title'] ?? '',
              image: json['image'] ?? '',
            ))
        .toList();

    return TopDestinationResponseModel(
      message: '',
      data: convertedData,
    );
  }
}
