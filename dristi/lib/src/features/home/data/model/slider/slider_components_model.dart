import 'package:dristi/src/core/assets/assets.dart';

class SliderComponentsModel {
  SliderComponentsModel({
    required this.title,
    required this.image,
  });

  final String title;
  final String image;

  static List<SliderComponentsModel> fetchAllData() => [
        SliderComponentsModel(
          title: 'Sundarbans',
          image: Assets.sundarbans,
        ),
        SliderComponentsModel(
          title: "Cox's Bazar",
          image: Assets.coxsBazar,
        ),
        SliderComponentsModel(
          title: 'Saint Martins',
          image: Assets.saintMartins,
        ),
        SliderComponentsModel(
          title: 'Nafakhum',
          image: Assets.nafakhum,
        ),
        SliderComponentsModel(
          title: 'Sajek Valley',
          image: Assets.sajekValley,
        ),
      ];
}
