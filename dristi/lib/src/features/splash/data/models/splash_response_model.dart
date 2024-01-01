import 'package:dristi/src/features/splash/data/models/splash_components_model.dart';
import 'package:dristi/src/features/splash/domain/entities/splash_entity.dart';

class SplashResponseModel<T> {
  SplashResponseModel({
    required this.message,
    required this.data,
  });

  final String message;
  final List<SplashEntity> data;

  factory SplashResponseModel.fromSplashComponentsModel(
      List<SplashComponentsModel> splashComponents) {
    List<SplashEntity> convertedData = splashComponents
        .map((splashModel) => SplashEntity(
              title: splashModel.title.toString(),
              image: splashModel.image.toString(),
              textColor: splashModel.textColor,
            ))
        .toList();

    return SplashResponseModel(
      message: '',
      data: convertedData,
    );
  }
}
