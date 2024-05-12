import 'package:dristi/src/features/home/popular_districts/domain/entity/popular_districts_entity.dart';

class PopularDistrictsResponseModel {
  PopularDistrictsResponseModel(this.popularDistrictItems);

  PopularDistrictsResponseModel.fromJson({
    required List<dynamic> json,
  }) {
    popularDistrictItems = <PopularDistrictEntity>[];
    for (var item in json) {
      popularDistrictItems.add(PopularDistrictData.fromJson(item));
    }
  }

  List<PopularDistrictEntity> popularDistrictItems = <PopularDistrictEntity>[];
}

class PopularDistrictData extends PopularDistrictEntity {
  String? sliderTitleEn;
  String? sliderTitleBn;
  String? sliderImage;

  PopularDistrictData({
    this.sliderTitleEn,
    this.sliderTitleBn,
    this.sliderImage,
  }) : super(
          titleEn: sliderTitleEn ?? "",
          titleBn: sliderTitleBn ?? "",
          image: sliderImage ?? "",
        );

  factory PopularDistrictData.fromJson(dynamic json) {
    return PopularDistrictData(
      sliderTitleEn: json['title_en'],
      sliderTitleBn: json['title_bn'],
      sliderImage: json['image'],
    );
  }
}
