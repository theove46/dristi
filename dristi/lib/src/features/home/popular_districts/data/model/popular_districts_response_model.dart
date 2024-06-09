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
  String? sliderTitle;
  String? sliderImage;

  PopularDistrictData({
    this.sliderTitle,
    this.sliderImage,
  }) : super(
          title: sliderTitle ?? "",
          image: sliderImage ?? "",
        );

  factory PopularDistrictData.fromJson(dynamic json) {
    return PopularDistrictData(
      sliderTitle: json['title'],
      sliderImage: json['image'],
    );
  }
}
