import 'package:dristi/src/core/assets/assets.dart';

class TopDestinationComponentsModel {
  TopDestinationComponentsModel({
    required this.title,
    required this.image,
  });

  final String title;
  final String image;

  static List<TopDestinationComponentsModel> fetchAllData() => [
        TopDestinationComponentsModel(
          title: 'Inani Beach',
          image: Assets.inaniBeach,
        ),
        TopDestinationComponentsModel(
          title: 'Kaptai Lake',
          image: Assets.kaptaiLake,
        ),
        TopDestinationComponentsModel(
          title: "Nil Giri",
          image: Assets.nilgiri,
        ),
        TopDestinationComponentsModel(
          title: "Hiron Point",
          image: Assets.hironPoint,
        ),
        TopDestinationComponentsModel(
          title: 'Tanguar Haor',
          image: Assets.tanguarHaor,
        ),
        TopDestinationComponentsModel(
          title: 'Jaflong',
          image: Assets.jaflong,
        ),
      ];
}
