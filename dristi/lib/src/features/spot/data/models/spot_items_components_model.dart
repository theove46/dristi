import 'package:dristi/src/core/assets/assets.dart';

class SpotItemComponentsModel {
  SpotItemComponentsModel({
    required this.title,
    required this.image,
  });

  final String title;
  final String image;

  static List<SpotItemComponentsModel> fetchAllData() => [
        SpotItemComponentsModel(
          title: 'Hotels',
          image: Assets.live,
        ),
        SpotItemComponentsModel(
          title: "Nearest",
          image: Assets.nearest,
        ),
        SpotItemComponentsModel(
          title: 'Plans',
          image: Assets.plans,
        ),
        SpotItemComponentsModel(
          title: 'Seasons',
          image: Assets.seasons,
        ),
        SpotItemComponentsModel(
          title: 'Specials',
          image: Assets.specials,
        ),
        SpotItemComponentsModel(
          title: 'Cautions',
          image: Assets.caution,
        ),
      ];
}
