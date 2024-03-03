import 'package:dristi/src/features/home/categories/data/model/categories_ui_model.dart';

class CategoryEntity {
  String titleEn;
  String titleBn;
  String image;

  CategoryEntity({
    required this.titleEn,
    required this.titleBn,
    required this.image,
  });

  CategoriesUIModel toCategoriesUIModel() => CategoriesUIModel(
        titleEn: titleEn,
        titleBn: titleBn,
        image: image,
      );
}
