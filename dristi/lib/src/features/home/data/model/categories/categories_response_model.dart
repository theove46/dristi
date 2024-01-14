import 'package:dristi/src/features/home/data/model/categories/categories_components_model.dart';
import 'package:dristi/src/features/home/domain/entities/categories_entity.dart';

class CategoriesResponseModel<T> {
  CategoriesResponseModel({
    required this.message,
    required this.data,
  });

  final String message;
  final List<CategoriesEntity> data;

  factory CategoriesResponseModel.fromCategoriesComponentsModel(
      List<CategoriesComponentsModel> categoriesComponents) {
    List<CategoriesEntity> convertedData = categoriesComponents
        .map((categoriesModel) => CategoriesEntity(
              title: categoriesModel.title.toString(),
              image: categoriesModel.image.toString(),
            ))
        .toList();

    return CategoriesResponseModel(
      message: '',
      data: convertedData,
    );
  }
}
