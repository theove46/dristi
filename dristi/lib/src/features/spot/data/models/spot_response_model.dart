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

  SpotData({
    this.spotsId,
    this.spotsTitle,
    this.spotsOnImageTitle,
    this.spotsDistricts,
    this.spotsDivision,
    this.spotsCategory,
    this.spotsImage,
  }) : super(
          id: spotsId ?? "",
          title: spotsTitle ?? "",
          onImageTitle: spotsOnImageTitle ?? "",
          district: spotsDistricts ?? "",
          division: spotsDivision ?? "",
          category: spotsCategory ?? "",
          image: spotsImage ?? "",
        );

  factory SpotData.fromJson(dynamic json) {
    return SpotData(
      spotsId: json['id'],
      spotsTitle: json['title'],
      spotsOnImageTitle: json['onImageTitle'],
      spotsDistricts: json['district'],
      spotsDivision: json['division'],
      spotsCategory: json['category'],
      spotsImage: json['image'],
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
