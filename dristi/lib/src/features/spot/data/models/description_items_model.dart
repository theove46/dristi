import 'package:dristi/src/core/assets/assets.dart';

class DescriptionItemsModel {
  DescriptionItemsModel({
    required this.title,
    required this.image,
  });

  final String title;
  final String image;

  static List<DescriptionItemsModel> fetchAllData() => [
        DescriptionItemsModel(
          title: 'Hotels',
          image: Assets.live,
        ),
        DescriptionItemsModel(
          title: "Nearest",
          image: Assets.nearest,
        ),
        DescriptionItemsModel(
          title: 'Plans',
          image: Assets.plans,
        ),
        DescriptionItemsModel(
          title: 'Seasons',
          image: Assets.seasons,
        ),
        DescriptionItemsModel(
          title: 'Specials',
          image: Assets.specials,
        ),
        DescriptionItemsModel(
          title: 'Cautions',
          image: Assets.caution,
        ),
      ];
}
