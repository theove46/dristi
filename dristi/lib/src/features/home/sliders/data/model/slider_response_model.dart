import 'package:dristi/src/features/home/sliders/data/model/slider_components_model.dart';
import 'package:dristi/src/features/home/sliders/domain/entity/slider_entity.dart';

class SliderResponseModel<T> {
  SliderResponseModel({
    required this.message,
    required this.data,
  });

  final String message;
  final List<SliderEntity> data;

  factory SliderResponseModel.fromSliderComponentsModel(
      List<SliderComponentsModel> sliderComponents) {
    List<SliderEntity> convertedData = sliderComponents
        .map((sliderModel) => SliderEntity(
              title: sliderModel.title.toString(),
              image: sliderModel.image.toString(),
            ))
        .toList();

    return SliderResponseModel(
      message: '',
      data: convertedData,
    );
  }
}
