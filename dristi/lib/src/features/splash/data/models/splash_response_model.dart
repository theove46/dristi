import 'package:dristi/src/features/splash/domain/entities/splash_entity.dart';

class SplashResponseModel<T> {
  SplashResponseModel({
    required this.message,
    required this.data,
  });

  final String message;
  final List<SplashEntity> data;

  factory SplashResponseModel.fromJson(List<dynamic> jsonList) {
    List<SplashEntity> convertedData = jsonList
        .map((json) => SplashEntity(
              title: json['title'] ?? '',
              image: json['image'] ?? '',
            ))
        .toList();

    return SplashResponseModel(
      message: '',
      data: convertedData,
    );
  }
}
