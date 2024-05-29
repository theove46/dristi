import 'package:dristi/src/features/on_boarding/data/models/on_boarding_ui_model.dart';

class OnBoardingEntity {
  String title;
  String image;

  OnBoardingEntity({
    required this.title,
    required this.image,
  });

  OnBoardingUIModel toSliderUIModel() => OnBoardingUIModel(
        title: title,
        image: image,
      );
}
