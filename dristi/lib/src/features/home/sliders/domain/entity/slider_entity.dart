import 'package:dristi/src/features/home/sliders/data/model/slider_ui_model.dart';

class SliderEntity {
  String title;
  String image;

  SliderEntity({
    required this.title,
    required this.image,
  });

  SliderUIModel toSliderUIModel() => SliderUIModel(
        title: title,
        image: image,
      );
}
