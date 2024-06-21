import 'package:dristi/src/features/destinations/domain/entities/destination_entity.dart';

class DestinationsResponseModel {
  DestinationsResponseModel(this.destinationsItems);

  DestinationsResponseModel.fromJson({
    required List<dynamic> json,
  }) {
    destinationsItems = <DestinationEntity>[];
    for (var item in json) {
      destinationsItems.add(DestinationData.fromJson(item));
    }
  }

  List<DestinationEntity> destinationsItems = <DestinationEntity>[];
}

class DestinationData extends DestinationEntity {
  String? destinationId;
  String? destinationTitle;
  String? destinationOnImageTitle;
  String? destinationDistrict;
  String? destinationDivision;
  String? destinationCategory;
  String? destinationImage;

  DestinationData({
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

  factory DestinationData.fromJson(dynamic json) {
    return DestinationData(
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
