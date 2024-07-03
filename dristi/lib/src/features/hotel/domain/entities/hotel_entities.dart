import 'package:dristi/src/core/global_entity/global_entity.dart';

class HotelEntity {
  String id;
  String title;
  String onImageTitle;
  String district;
  String division;
  String category;
  String address;
  String description;
  String mapUrl;
  List<ImagesEntity>? images;
  List<String>? phones;
  List<WebsiteEntity>? websites;

  HotelEntity({
    required this.id,
    required this.title,
    required this.onImageTitle,
    required this.district,
    required this.division,
    required this.category,
    required this.address,
    required this.description,
    required this.mapUrl,
    required this.images,
    required this.phones,
    required this.websites,
  });

  HotelEntity.initial()
      : id = "",
        title = "",
        onImageTitle = "",
        district = "",
        division = "",
        category = "",
        address = "",
        mapUrl = "",
        description = "",
        images = [],
        phones = [],
        websites = [];
}

class WebsiteEntity {
  WebsiteEntity({
    required this.url,
    required this.site,
  });

  String url;
  String site;
}

class HotelItemsEntity {
  HotelItemsEntity({
    required this.title,
    required this.image,
  });

  String title;
  String image;
}
