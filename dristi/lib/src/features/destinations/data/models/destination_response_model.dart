import 'package:dristi/src/features/destinations/domain/entities/destination_entity.dart';

class DestinationResponseModel<T> {
  DestinationResponseModel({
    required this.message,
    required this.data,
  });

  final String message;
  final List<DestinationEntity> data;

  factory DestinationResponseModel.fromJson(List<dynamic> jsonList) {
    List<DestinationEntity> convertedData = jsonList
        .map((json) => DestinationEntity(
              title: json['title'] ?? '',
              division: json['division'] ?? '',
            ))
        .toList();

    return DestinationResponseModel(
      message: '',
      data: convertedData,
    );
  }
}
