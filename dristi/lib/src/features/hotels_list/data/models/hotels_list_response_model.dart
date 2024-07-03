import 'package:dristi/src/features/hotels_list/domain/entities/hotels_list_entity.dart';

class HotelsListResponseModel {
  HotelsListResponseModel(this.hotelsItems);

  HotelsListResponseModel.fromJson({
    required List<dynamic> json,
  }) {
    hotelsItems = <HotelsListEntity>[];
    for (var item in json) {
      hotelsItems.add(HotelData.fromJson(item));
    }
  }

  List<HotelsListEntity> hotelsItems = <HotelsListEntity>[];
}

class HotelData extends HotelsListEntity {
  String? hotelsId;
  String? hotelsTitle;
  String? hotelsOnImageTitle;
  String? hotelsDistrict;
  String? hotelsDivision;
  String? hotelsCategory;
  String? hotelsImage;

  HotelData({
    this.hotelsId,
    this.hotelsTitle,
    this.hotelsOnImageTitle,
    this.hotelsDistrict,
    this.hotelsDivision,
    this.hotelsCategory,
    this.hotelsImage,
  }) : super(
          id: hotelsId ?? "",
          title: hotelsTitle ?? "",
          onImageTitle: hotelsOnImageTitle ?? "",
          district: hotelsDistrict ?? "",
          division: hotelsDivision ?? "",
          category: hotelsCategory ?? "",
          image: hotelsImage ?? "",
        );

  factory HotelData.fromJson(dynamic json) {
    return HotelData(
      hotelsId: json['id'],
      hotelsTitle: json['title'],
      hotelsOnImageTitle: json['onImageTitle'],
      hotelsDistrict: json['district'],
      hotelsDivision: json['division'],
      hotelsCategory: json['category'],
      hotelsImage: json['image'],
    );
  }
}
