import 'package:dristi/src/core/assets/assets.dart';

class CategoriesComponentsModel {
  CategoriesComponentsModel({
    required this.title,
    required this.image,
  });

  final String title;
  final String image;

  static List<CategoriesComponentsModel> fetchAllData() => [
        CategoriesComponentsModel(
          title: 'Beaches',
          image: Assets.beach,
        ),
        CategoriesComponentsModel(
          title: "Mountains",
          image: Assets.mountains,
        ),
        CategoriesComponentsModel(
          title: 'Forests',
          image: Assets.forest,
        ),
        CategoriesComponentsModel(
          title: 'Waterfalls',
          image: Assets.waterfalls,
        ),
        CategoriesComponentsModel(
          title: 'Heritages',
          image: Assets.heritage,
        ),
        CategoriesComponentsModel(
          title: 'Lakes',
          image: Assets.lake,
        ),
        CategoriesComponentsModel(
          title: 'Theme Parks',
          image: Assets.themePark,
        ),
        CategoriesComponentsModel(
          title: 'Monuments',
          image: Assets.monument,
        ),
        CategoriesComponentsModel(
          title: 'Museums',
          image: Assets.museum,
        ),
        CategoriesComponentsModel(
          title: 'National Parks',
          image: Assets.nationalPark,
        ),
        CategoriesComponentsModel(
          title: 'Resorts',
          image: Assets.resort,
        ),
        CategoriesComponentsModel(
          title: 'All Categories',
          image: Assets.allCategories,
        ),
      ];
}
