import 'package:dristi/src/features/accommodations_list/domain/entities/accommodations_list_entity.dart';

class AccommodationsListResponseModel {
  AccommodationsListResponseModel(this.accommodationsListItems);

  AccommodationsListResponseModel.fromJson({
    required List<dynamic> json,
  }) {
    accommodationsListItems = <AccommodationsListEntity>[];
    for (var item in json) {
      accommodationsListItems.add(AccommodationsListData.fromJson(item));
    }
  }

  List<AccommodationsListEntity> accommodationsListItems =
      <AccommodationsListEntity>[];
}

class AccommodationsListData extends AccommodationsListEntity {
  String? accommodationsListId;
  String? accommodationsListTitle;
  String? accommodationsListOnImageTitle;
  String? accommodationsListDistrict;
  String? accommodationsListDivision;
  String? accommodationsListCategory;
  String? accommodationsListImage;

  AccommodationsListData({
    this.accommodationsListId,
    this.accommodationsListTitle,
    this.accommodationsListOnImageTitle,
    this.accommodationsListDistrict,
    this.accommodationsListDivision,
    this.accommodationsListCategory,
    this.accommodationsListImage,
  }) : super(
          id: accommodationsListId ?? "",
          title: accommodationsListTitle ?? "",
          onImageTitle: accommodationsListOnImageTitle ?? "",
          district: accommodationsListDistrict ?? "",
          division: accommodationsListDivision ?? "",
          category: accommodationsListCategory ?? "",
          image: accommodationsListImage ?? "",
        );

  factory AccommodationsListData.fromJson(dynamic json) {
    return AccommodationsListData(
      accommodationsListId: json['id'],
      accommodationsListTitle: json['title'],
      accommodationsListOnImageTitle: json['onImageTitle'],
      accommodationsListDistrict: json['district'],
      accommodationsListDivision: json['division'],
      accommodationsListCategory: json['category'],
      accommodationsListImage: json['image'],
    );
  }
}
