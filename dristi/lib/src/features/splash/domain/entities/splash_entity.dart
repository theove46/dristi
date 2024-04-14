import 'package:dristi/src/features/splash/data/models/splash_ui_model.dart';

class SplashEntity {
  String title;
  String image;

  SplashEntity({
    required this.title,
    required this.image,
  });

  SplashUIModel toSliderUIModel() => SplashUIModel(
        title: title,
        image: image,
      );
}
