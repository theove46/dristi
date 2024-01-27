import 'package:dristi/src/features/spot/domain/entities/spot_item_entities.dart';

class SpotItemResponseModel<T> {
  SpotItemResponseModel({
    required this.message,
    required this.data,
  });

  final String message;
  final List<SpotItemsEntity> data;

  factory SpotItemResponseModel.fromJson(List<dynamic> jsonList) {
    List<SpotItemsEntity> convertedData = jsonList
        .map((json) => SpotItemsEntity(
              title: json['title'] ?? '',
              image: json['image'] ?? '',
            ))
        .toList();

    return SpotItemResponseModel(
      message: '',
      data: convertedData,
    );
  }
}
