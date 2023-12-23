import 'package:dristi/src/core/assets/assets.dart';

class CarouselModel {
  CarouselModel({
    required this.title,
    required this.image,
  });

  final String title;
  final String image;

  static List<CarouselModel> fetchAllData() => [
        CarouselModel(
          title: 'Sundarbans',
          image: Assets.sundarbans,
        ),
        CarouselModel(
          title: "Cox's Bazar",
          image: Assets.coxsBazar,
        ),
        CarouselModel(
          title: 'Saint Martins',
          image: Assets.saintMartins,
        ),
        CarouselModel(
          title: 'Nafakhum',
          image: Assets.nafakhum,
        ),
        CarouselModel(
          title: 'Sajek Valley',
          image: Assets.sajekValley,
        ),
      ];
}
