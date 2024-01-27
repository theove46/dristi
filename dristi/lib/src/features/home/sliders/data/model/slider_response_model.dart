import 'package:dristi/src/features/home/sliders/domain/entity/slider_entity.dart';

class SliderResponseModel<T> {
  SliderResponseModel({
    required this.message,
    required this.data,
  });

  final String message;
  final List<SliderEntity> data;

  factory SliderResponseModel.fromJson(List<dynamic> jsonList) {
    List<SliderEntity> convertedData = jsonList
        .map((json) => SliderEntity(
              title: json['title'] ?? '',
              image: json['image'] ?? '',
            ))
        .toList();

    return SliderResponseModel(
      message: '',
      data: convertedData,
    );
  }
}
