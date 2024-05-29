import 'package:dristi/src/features/home/top_destinations/domain/entity/top_destinations_entity.dart';

class TopDestinationsResponseModel {
  TopDestinationsResponseModel(this.topDestinationsItems);

  TopDestinationsResponseModel.fromJson({
    required List<dynamic> json,
  }) {
    topDestinationsItems = <TopDestinationsEntity>[];
    for (var item in json) {
      topDestinationsItems.add(TopDestinationsData.fromJson(item));
    }
  }

  List<TopDestinationsEntity> topDestinationsItems = <TopDestinationsEntity>[];
}

class TopDestinationsData extends TopDestinationsEntity {
  String? destinationTitleEn;
  String? destinationTitleBn;
  String? destinationImage;

  TopDestinationsData({
    this.destinationTitleEn,
    this.destinationTitleBn,
    this.destinationImage,
  }) : super(
          titleEn: destinationTitleEn ?? "",
          titleBn: destinationTitleBn ?? "",
          image: destinationImage ?? "",
        );

  factory TopDestinationsData.fromJson(dynamic json) {
    return TopDestinationsData(
      destinationTitleEn: json['title_en'],
      destinationTitleBn: json['title_bn'],
      destinationImage: json['image'],
    );
  }
}
