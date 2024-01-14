import 'package:dristi/src/features/home/data/model/popular_districts/popular_districts_components_model.dart';
import 'package:dristi/src/features/home/domain/entities/popular_districts_entity.dart';

class PopularDistrictResponseModel<T> {
  PopularDistrictResponseModel({
    required this.message,
    required this.data,
  });

  final String message;
  final List<PopularDistrictEntity> data;

  factory PopularDistrictResponseModel.fromPopularDistrictComponentsModel(
      List<PopularDistrictsComponentsModel> popularDistrictComponents) {
    List<PopularDistrictEntity> convertedData = popularDistrictComponents
        .map((popularDistrictModel) => PopularDistrictEntity(
              title: popularDistrictModel.title.toString(),
              image: popularDistrictModel.image.toString(),
            ))
        .toList();

    return PopularDistrictResponseModel(
      message: '',
      data: convertedData,
    );
  }
}
