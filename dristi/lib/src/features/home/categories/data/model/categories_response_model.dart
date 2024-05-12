import 'package:dristi/src/features/home/categories/domain/entity/categories_entity.dart';

class CategoriesResponseModel {
  CategoriesResponseModel(this.categoryItems);

  CategoriesResponseModel.fromJson({
    required List<dynamic> json,
  }) {
    categoryItems = <CategoryEntity>[];
    for (var item in json) {
      categoryItems.add(CategoryData.fromJson(item));
    }
  }

  List<CategoryEntity> categoryItems = <CategoryEntity>[];
}

class CategoryData extends CategoryEntity {
  String? sliderTitleEn;
  String? sliderTitleBn;
  String? sliderImage;

  CategoryData({
    this.sliderTitleEn,
    this.sliderTitleBn,
    this.sliderImage,
  }) : super(
          titleEn: sliderTitleEn ?? "",
          titleBn: sliderTitleBn ?? "",
          image: sliderImage ?? "",
        );

  factory CategoryData.fromJson(dynamic json) {
    return CategoryData(
      sliderTitleEn: json['title_en'],
      sliderTitleBn: json['title_bn'],
      sliderImage: json['image'],
    );
  }
}
