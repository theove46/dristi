import 'package:dristi/src/features/home/advertisements/domain/entity/advertisement_entity.dart';

class MultipleAdvertisementResponseModel {
  MultipleAdvertisementResponseModel(this.multipleAdvertisementItems);

  MultipleAdvertisementResponseModel.fromJson({
    required List<dynamic> json,
  }) {
    multipleAdvertisementItems = <MultipleAdvertisementEntity>[];
    for (var item in json) {
      multipleAdvertisementItems.add(MultipleAdvertisementData.fromJson(item));
    }
  }

  List<MultipleAdvertisementEntity> multipleAdvertisementItems =
      <MultipleAdvertisementEntity>[];
}

class MultipleAdvertisementData extends MultipleAdvertisementEntity {
  String? advertisementTitle;
  String? advertisementUrl;
  String? advertisementImage;

  MultipleAdvertisementData({
    this.advertisementTitle,
    this.advertisementUrl,
    this.advertisementImage,
  }) : super(
          title: advertisementTitle ?? "",
          url: advertisementUrl ?? "",
          image: advertisementImage ?? "",
        );

  factory MultipleAdvertisementData.fromJson(dynamic json) {
    return MultipleAdvertisementData(
      advertisementTitle: json['title'],
      advertisementUrl: json['url'],
      advertisementImage: json['image'],
    );
  }
}
