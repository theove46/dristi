import 'package:dristi/src/features/home/popular_districts/domain/entity/popular_districts_entity.dart';

class PopularDistrictResponseModel<T> {
  PopularDistrictResponseModel({
    required this.message,
    required this.data,
  });

  final String message;
  final List<PopularDistrictEntity> data;

  factory PopularDistrictResponseModel.fromJson(List<dynamic> jsonList) {
    List<PopularDistrictEntity> convertedData = jsonList
        .map((json) => PopularDistrictEntity(
              title: json['title'] ?? '',
              image: json['image'] ?? '',
            ))
        .toList();

    return PopularDistrictResponseModel(
      message: '',
      data: convertedData,
    );
  }
}
