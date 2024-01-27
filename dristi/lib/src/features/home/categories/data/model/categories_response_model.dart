import 'package:dristi/src/features/home/categories/domain/entity/categories_entity.dart';

class CategoriesResponseModel<T> {
  CategoriesResponseModel({
    required this.message,
    required this.data,
  });

  final String message;
  final List<CategoriesEntity> data;

  factory CategoriesResponseModel.fromJson(List<dynamic> jsonList) {
    List<CategoriesEntity> convertedData = jsonList
        .map((json) => CategoriesEntity(
              title: json['title'] ?? '',
              image: json['image'] ?? '',
            ))
        .toList();

    return CategoriesResponseModel(
      message: '',
      data: convertedData,
    );
  }
}
