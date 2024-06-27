import 'package:dristi/src/features/destinations_list/domain/entities/destinations_list_entity.dart';

class DestinationsListResponseModel {
  DestinationsListResponseModel(this.destinationsListItems);

  DestinationsListResponseModel.fromJson({
    required List<dynamic> json,
  }) {
    destinationsListItems = <DestinationsListEntity>[];
    for (var item in json) {
      destinationsListItems.add(DestinationsListData.fromJson(item));
    }
  }

  List<DestinationsListEntity> destinationsListItems =
      <DestinationsListEntity>[];
}

class DestinationsListData extends DestinationsListEntity {
  String? destinationId;
  String? destinationTitle;
  String? destinationOnImageTitle;
  String? destinationDistrict;
  String? destinationDivision;
  String? destinationCategory;
  String? destinationImage;

  DestinationsListData({
    this.destinationId,
    this.destinationTitle,
    this.destinationOnImageTitle,
    this.destinationDistrict,
    this.destinationDivision,
    this.destinationCategory,
    this.destinationImage,
  }) : super(
          id: destinationId ?? "",
          title: destinationTitle ?? "",
          onImageTitle: destinationOnImageTitle ?? "",
          district: destinationDistrict ?? "",
          division: destinationDivision ?? "",
          category: destinationCategory ?? "",
          image: destinationImage ?? "",
        );

  factory DestinationsListData.fromJson(dynamic json) {
    return DestinationsListData(
      destinationId: json['id'],
      destinationTitle: json['title'],
      destinationOnImageTitle: json['onImageTitle'],
      destinationDistrict: json['district'],
      destinationDivision: json['division'],
      destinationCategory: json['category'],
      destinationImage: json['image'],
    );
  }
}
