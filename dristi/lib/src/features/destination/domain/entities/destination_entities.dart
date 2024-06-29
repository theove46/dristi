import 'package:flutter/material.dart';

class DestinationEntity {
  String id;
  String title;
  String onImageTitle;
  String district;
  String division;
  String category;
  String image;
  String details;
  String mapUrl;
  List<ImagesEntity>? images;
  List<String>? seasons;
  List<String>? cautions;
  List<String>? specials;
  List<BlogsEntity>? blogs;

  DestinationEntity({
    required this.id,
    required this.title,
    required this.onImageTitle,
    required this.district,
    required this.division,
    required this.category,
    required this.image,
    required this.details,
    required this.mapUrl,
    required this.images,
    required this.seasons,
    required this.cautions,
    required this.specials,
    required this.blogs,
  });

  DestinationEntity.initial()
      : id = "",
        title = "",
        onImageTitle = "",
        district = "",
        division = "",
        category = "",
        image = "",
        mapUrl = "",
        details = "",
        images = [],
        seasons = [],
        cautions = [],
        specials = [],
        blogs = [];
}

class ImagesEntity {
  ImagesEntity({
    required this.url,
    required this.credit,
  });

  String url;
  String credit;
}

class BlogsEntity {
  BlogsEntity({
    required this.title,
    required this.url,
    required this.author,
    required this.site,
  });

  String title;
  String url;
  String author;
  String site;
}

class DestinationItemsEntity {
  DestinationItemsEntity({
    required this.title,
    required this.image,
  });

  String title;
  String image;
}

class GalleryScreenEntity {
  final Key? key;
  final String galleryName;
  final List<ImagesEntity> images;
  final int initialIndex;
  GalleryScreenEntity({
    this.key,
    required this.galleryName,
    required this.images,
    this.initialIndex = 0,
  });
}
