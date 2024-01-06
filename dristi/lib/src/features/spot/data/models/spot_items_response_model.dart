import 'package:dristi/src/features/spot/data/models/spot_items_components_model.dart';
import 'package:dristi/src/features/spot/domain/entities/spot_item_entities.dart';

class SpotItemResponseModel<T> {
  SpotItemResponseModel({
    required this.message,
    required this.data,
  });

  final String message;
  final List<SpotItemsEntity> data;

  factory SpotItemResponseModel.fromSpotItemComponentsModel(
      List<SpotItemComponentsModel> spotItemComponents) {
    List<SpotItemsEntity> convertedData = spotItemComponents
        .map((spotItemModel) => SpotItemsEntity(
              title: spotItemModel.title.toString(),
              image: spotItemModel.image.toString(),
            ))
        .toList();

    return SpotItemResponseModel(
      message: '',
      data: convertedData,
    );
  }
}
