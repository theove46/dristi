import 'package:dristi/src/features/spot/domain/entities/spot_entities.dart';

class SpotItemsResponseModel<T> {
  SpotItemsResponseModel({
    required this.message,
    required this.data,
  });

  final String message;
  final List<SpotItemsEntity> data;

  factory SpotItemsResponseModel.fromJson(List<dynamic> jsonList) {
    List<SpotItemsEntity> convertedData = jsonList
        .map((json) => SpotItemsEntity(
              title: json['title'] ?? '',
              image: json['image'] ?? '',
            ))
        .toList();

    return SpotItemsResponseModel(
      message: '',
      data: convertedData,
    );
  }
}
