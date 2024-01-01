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
          title: 'Beaches',
          image: Assets.beach,
        ),
        CategoriesModel(
          title: "Mountains",
          image: Assets.mountains,
        ),
        CategoriesModel(
          title: 'Forests',
          image: Assets.forest,
        ),
        CategoriesModel(
          title: 'Waterfalls',
          image: Assets.waterfalls,
        ),
        CategoriesModel(
          title: 'Heritages',
          image: Assets.heritage,
        ),
        CategoriesModel(
          title: 'Lakes',
          image: Assets.lake,
        ),
        CategoriesModel(
          title: 'Theme Parks',
          image: Assets.themePark,
        ),
        CategoriesModel(
          title: 'Monuments',
          image: Assets.monument,
        ),
        CategoriesModel(
          title: 'Museums',
          image: Assets.museum,
        ),
        CategoriesModel(
          title: 'National Parks',
          image: Assets.nationalPark,
        ),
        CategoriesModel(
          title: 'Resorts',
          image: Assets.resort,
        ),
        CategoriesModel(
          title: 'All Categories',
          image: Assets.allCategories,
        ),
      ];
}
