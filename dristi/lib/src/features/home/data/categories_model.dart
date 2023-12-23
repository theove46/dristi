import 'package:dristi/src/core/assets/assets.dart';

class CategoriesModel {
  CategoriesModel({
    required this.title,
    required this.image,
  });

  final String title;
  final String image;

  static List<CategoriesModel> fetchAllData() => [
        CategoriesModel(
          title: 'Beach',
          image: Assets.beach,
        ),
        CategoriesModel(
          title: "Mountains",
          image: Assets.mountains,
        ),
        CategoriesModel(
          title: 'Forest',
          image: Assets.forest,
        ),
        CategoriesModel(
          title: 'Waterfalls',
          image: Assets.waterfalls,
        ),
        CategoriesModel(
          title: 'Heritage',
          image: Assets.heritage,
        ),
        CategoriesModel(
          title: 'Lake',
          image: Assets.lake,
        ),
        CategoriesModel(
          title: 'Theme Park',
          image: Assets.themePark,
        ),
        CategoriesModel(
          title: 'Monument',
          image: Assets.monument,
        ),
        CategoriesModel(
          title: 'Museum',
          image: Assets.museum,
        ),
        CategoriesModel(
          title: 'National Park',
          image: Assets.nationalPark,
        ),
        CategoriesModel(
          title: 'Resort',
          image: Assets.resort,
        ),
        CategoriesModel(
          title: 'All',
          image: Assets.allCategories,
        ),
      ];
}
