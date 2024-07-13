import 'package:dristi/src/core/global_entity/global_entity.dart';
import 'package:dristi/src/features/accommodation/domain/entities/accommodation_entities.dart';

class AccommodationResponseModel {
  AccommodationResponseModel(this.accommodation);

  AccommodationResponseModel.fromJson({
    required dynamic json,
  }) {
    accommodation = AccommodationData.fromJson(json);
  }

  AccommodationEntity accommodation = AccommodationEntity.initial();
}

class AccommodationData extends AccommodationEntity {
  String? accommodationId;
  String? accommodationTitle;
  String? accommodationOnImageTitle;
  String? accommodationDistricts;
  String? accommodationDivision;
  String? accommodationCategory;
  String? accommodationAddress;
  String? accommodationDescription;
  String? accommodationMapUrl;
  List<String>? accommodationPhones;
  List<ImagesData>? accommodationImages;
  List<WebsiteData>? accommodationWebsites;

  AccommodationData({
    this.accommodationId,
    this.accommodationTitle,
    this.accommodationOnImageTitle,
    this.accommodationDistricts,
    this.accommodationDivision,
    this.accommodationCategory,
    this.accommodationAddress,
    this.accommodationDescription,
    this.accommodationMapUrl,
    this.accommodationPhones,
    this.accommodationImages,
    this.accommodationWebsites,
  }) : super(
          id: accommodationId ?? "",
          title: accommodationTitle ?? "",
          onImageTitle: accommodationOnImageTitle ?? "",
          district: accommodationDistricts ?? "",
          division: accommodationDivision ?? "",
          category: accommodationCategory ?? "",
          address: accommodationAddress ?? "",
          description: accommodationDescription ?? "",
          mapUrl: accommodationMapUrl ?? "",
          phones: accommodationPhones ?? [],
          images: accommodationImages ?? [],
          websites: accommodationWebsites ?? [],
        );

  factory AccommodationData.fromJson(dynamic json) {
    List<dynamic>? imagesJson = json['images'];
    List<ImagesData>? imagesDataList =
        imagesJson?.map((v) => ImagesData.fromJson(v)).toList();

    List<dynamic>? websiteJson = json['website'];
    List<WebsiteData>? websiteDataList =
        websiteJson?.map((v) => WebsiteData.fromJson(v)).toList();

    return AccommodationData(
      accommodationId: json['id'],
      accommodationTitle: json['title'],
      accommodationOnImageTitle: json['onImageTitle'],
      accommodationDistricts: json['district'],
      accommodationDivision: json['division'],
      accommodationCategory: json['category'],
      accommodationAddress: json['address'],
      accommodationDescription: json['description'],
      accommodationMapUrl: json['mapUrl'],
      accommodationPhones:
          json['phones'] != null ? json['phones'].cast<String>() : [],
      accommodationImages: imagesDataList,
      accommodationWebsites: websiteDataList,
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
