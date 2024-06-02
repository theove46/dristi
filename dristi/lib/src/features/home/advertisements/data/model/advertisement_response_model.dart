import 'package:dristi/src/features/home/advertisements/domain/entity/advertisement_entity.dart';

class AdvertisementResponseModel {
  AdvertisementResponseModel(this.advertisementItems);

  AdvertisementResponseModel.fromJson({
    required List<dynamic> json,
  }) {
    advertisementItems = <AdvertisementEntity>[];
    for (var item in json) {
      advertisementItems.add(AdvertisementData.fromJson(item));
    }
  }

  List<AdvertisementEntity> advertisementItems = <AdvertisementEntity>[];
}

class AdvertisementData extends AdvertisementEntity {
  String? advertisementTitle;
  String? advertisementUrl;
  String? advertisementImage;

  AdvertisementData({
    this.advertisementTitle,
    this.advertisementUrl,
    this.advertisementImage,
  }) : super(
          title: advertisementTitle ?? "",
          url: advertisementUrl ?? "",
          image: advertisementImage ?? "",
        );

  factory AdvertisementData.fromJson(dynamic json) {
    return AdvertisementData(
      advertisementTitle: json['title'],
      advertisementUrl: json['url'],
      advertisementImage: json['image'],
    );
  }
}
