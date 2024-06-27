import 'package:dristi/src/features/spot/domain/entities/spot_entities.dart';

class SpotResponseModel {
  SpotResponseModel(this.spots);

  SpotResponseModel.fromJson({
    required dynamic json,
  }) {
    spots = SpotData.fromJson(json);
  }

  SpotEntity spots = SpotEntity.initial();
}

class SpotData extends SpotEntity {
  String? spotsId;
  String? spotsTitle;
  String? spotsOnImageTitle;
  String? spotsDistricts;
  String? spotsDivision;
  String? spotsCategory;
  String? spotsImage;
  String? spotsDetails;
  String? spotsMapUrl;
  List<String>? spotsSeasons;
  List<String>? spotsCautions;
  List<String>? spotsSpecials;
  List<BlogsData>? spotsBlogs;

  SpotData({
    this.spotsId,
    this.spotsTitle,
    this.spotsOnImageTitle,
    this.spotsDistricts,
    this.spotsDivision,
    this.spotsCategory,
    this.spotsImage,
    this.spotsMapUrl,
    this.spotsDetails,
    this.spotsSeasons,
    this.spotsCautions,
    this.spotsSpecials,
    this.spotsBlogs,
  }) : super(
          id: spotsId ?? "",
          title: spotsTitle ?? "",
          onImageTitle: spotsOnImageTitle ?? "",
          district: spotsDistricts ?? "",
          division: spotsDivision ?? "",
          category: spotsCategory ?? "",
          image: spotsImage ?? "",
          mapUrl: spotsMapUrl ?? "",
          details: spotsDetails ?? "",
          seasons: spotsSeasons ?? [],
          cautions: spotsCautions ?? [],
          specials: spotsSpecials ?? [],
          blogs: spotsBlogs ?? [],
        );

  factory SpotData.fromJson(dynamic json) {
    List<dynamic>? blogsJson = json['blogs'];
    List<BlogsData>? blogsDataList =
        blogsJson?.map((v) => BlogsData.fromJson(v)).toList();

    return SpotData(
      spotsId: json['id'],
      spotsTitle: json['title'],
      spotsOnImageTitle: json['onImageTitle'],
      spotsDistricts: json['district'],
      spotsDivision: json['division'],
      spotsCategory: json['category'],
      spotsImage: json['image'],
      spotsMapUrl: json['mapUrl'],
      spotsDetails: json['details'],
      spotsSeasons:
          json['seasons'] != null ? json['seasons'].cast<String>() : [],
      spotsCautions:
          json['cautions'] != null ? json['cautions'].cast<String>() : [],
      spotsSpecials:
          json['specials'] != null ? json['specials'].cast<String>() : [],
      spotsBlogs: blogsDataList,
    );
  }
}

class BlogsData extends BlogsEntity {
  String? blogsTitle;
  String? blogsUrl;
  String? blogsAuthor;
  String? blogsSite;

  BlogsData({
    this.blogsTitle,
    this.blogsUrl,
    this.blogsAuthor,
    this.blogsSite,
  }) : super(
          title: blogsTitle ?? "",
          url: blogsUrl ?? "",
          author: blogsAuthor ?? "",
          site: blogsSite ?? "",
        );

  factory BlogsData.fromJson(dynamic json) {
    return BlogsData(
      blogsTitle: json['title'],
      blogsUrl: json['url'],
      blogsAuthor: json['author'],
      blogsSite: json['site'],
    );
  }
}

class SpotItemsResponseModel<T> {
  SpotItemsResponseModel({
    required this.message,
    required this.data,
  });

  final String message;
  final List<SpotItemsEntity> data;

  factory SpotItemsResponseModel.fromJson(List<dynamic> jsonList) {
    List<SpotItemsEntity> convertedData = jsonList
        .map((json) => SpotItemsEntity(
              title: json['title'] ?? '',
              image: json['image'] ?? '',
            ))
        .toList();

    return SpotItemsResponseModel(
      message: '',
      data: convertedData,
    );
  }
}
