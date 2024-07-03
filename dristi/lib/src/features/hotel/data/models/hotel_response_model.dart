import 'package:dristi/src/core/global_entity/global_entity.dart';
import 'package:dristi/src/features/hotel/domain/entities/hotel_entities.dart';

class HotelResponseModel {
  HotelResponseModel(this.hotel);

  HotelResponseModel.fromJson({
    required dynamic json,
  }) {
    hotel = HotelData.fromJson(json);
  }

  HotelEntity hotel = HotelEntity.initial();
}

class HotelData extends HotelEntity {
  String? hotelId;
  String? hotelTitle;
  String? hotelOnImageTitle;
  String? hotelDistricts;
  String? hotelDivision;
  String? hotelCategory;
  String? hotelAddress;
  String? hotelDescription;
  String? hotelMapUrl;
  List<String>? hotelPhones;
  List<ImagesData>? hotelImages;
  List<WebsiteData>? hotelWebsites;

  HotelData({
    this.hotelId,
    this.hotelTitle,
    this.hotelOnImageTitle,
    this.hotelDistricts,
    this.hotelDivision,
    this.hotelCategory,
    this.hotelAddress,
    this.hotelDescription,
    this.hotelMapUrl,
    this.hotelPhones,
    this.hotelImages,
    this.hotelWebsites,
  }) : super(
          id: hotelId ?? "",
          title: hotelTitle ?? "",
          onImageTitle: hotelOnImageTitle ?? "",
          district: hotelDistricts ?? "",
          division: hotelDivision ?? "",
          category: hotelCategory ?? "",
          address: hotelAddress ?? "",
          description: hotelDescription ?? "",
          mapUrl: hotelMapUrl ?? "",
          phones: hotelPhones ?? [],
          images: hotelImages ?? [],
          websites: hotelWebsites ?? [],
        );

  factory HotelData.fromJson(dynamic json) {
    List<dynamic>? imagesJson = json['images'];
    List<ImagesData>? imagesDataList =
        imagesJson?.map((v) => ImagesData.fromJson(v)).toList();

    List<dynamic>? websiteJson = json['website'];
    List<WebsiteData>? websiteDataList =
        websiteJson?.map((v) => WebsiteData.fromJson(v)).toList();

    return HotelData(
      hotelId: json['id'],
      hotelTitle: json['title'],
      hotelOnImageTitle: json['onImageTitle'],
      hotelDistricts: json['district'],
      hotelDivision: json['division'],
      hotelCategory: json['category'],
      hotelAddress: json['address'],
      hotelDescription: json['description'],
      hotelMapUrl: json['mapUrl'],
      hotelPhones: json['phones'] != null ? json['phones'].cast<String>() : [],
      hotelImages: imagesDataList,
      hotelWebsites: websiteDataList,
    );
  }
}

class ImagesData extends ImagesEntity {
  String? imageUrl;
  String? imageCredit;

  ImagesData({
    this.imageUrl,
    this.imageCredit,
  }) : super(
          url: imageUrl ?? "",
          credit: imageCredit ?? "",
        );

  factory ImagesData.fromJson(dynamic json) {
    return ImagesData(
      imageUrl: json['url'],
      imageCredit: json['credit'],
    );
  }
}

class WebsiteData extends WebsiteEntity {
  String? blogsUrl;
  String? blogsSite;

  WebsiteData({
    this.blogsUrl,
    this.blogsSite,
  }) : super(
          url: blogsUrl ?? "",
          site: blogsSite ?? "",
        );

  factory WebsiteData.fromJson(dynamic json) {
    return WebsiteData(
      blogsUrl: json['url'],
      blogsSite: json['site'],
    );
  }
}

class HotelItemsResponseModel<T> {
  HotelItemsResponseModel({
    required this.message,
    required this.data,
  });

  final String message;
  final List<HotelItemsEntity> data;

  factory HotelItemsResponseModel.fromJson(List<dynamic> jsonList) {
    List<HotelItemsEntity> convertedData = jsonList
        .map((json) => HotelItemsEntity(
              title: json['title'] ?? '',
              image: json['image'] ?? '',
            ))
        .toList();

    return HotelItemsResponseModel(
      message: '',
      data: convertedData,
    );
  }
}
