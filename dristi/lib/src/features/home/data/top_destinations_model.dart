import 'package:dristi/src/core/assets/assets.dart';

class TopDestinationsModel {
  TopDestinationsModel({
    required this.title,
    required this.image,
  });

  final String title;
  final String image;

  static List<TopDestinationsModel> fetchAllData() => [
        TopDestinationsModel(
          title: 'Inani Beach',
          image: Assets.inaniBeach,
        ),
        TopDestinationsModel(
          title: 'Kaptai Lake',
          image: Assets.kaptaiLake,
        ),
        TopDestinationsModel(
          title: "Nil Giri",
          image: Assets.nilgiri,
        ),
        TopDestinationsModel(
          title: "Hiron Point",
          image: Assets.hironPoint,
        ),
        TopDestinationsModel(
          title: 'Tanguar Haor',
          image: Assets.tanguarHaor,
        ),
        TopDestinationsModel(
          title: 'Jaflong',
          image: Assets.jaflong,
        ),
      ];
}
