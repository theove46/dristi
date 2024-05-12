import 'package:dristi/src/features/home/popular_districts/data/model/popular_districts_ui_model.dart';

class PopularDistrictEntity {
  String titleEn;
  String titleBn;
  String image;

  PopularDistrictEntity({
    required this.titleEn,
    required this.titleBn,
    required this.image,
  });

  PopularDistrictsUIModel toPopularDistrictsUIModel() =>
      PopularDistrictsUIModel(
        titleEn: titleEn,
        titleBn: titleBn,
        image: image,
      );
}
