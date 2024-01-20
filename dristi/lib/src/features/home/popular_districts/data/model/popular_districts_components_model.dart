import 'package:dristi/src/core/assets/assets.dart';

class PopularDistrictsComponentsModel {
  PopularDistrictsComponentsModel({
    required this.title,
    required this.image,
  });

  final String title;
  final String image;

  static List<PopularDistrictsComponentsModel> fetchAllData() => [
        PopularDistrictsComponentsModel(
          title: "Cox's Bazar",
          image: Assets.coxsBazar2,
        ),
        PopularDistrictsComponentsModel(
          title: 'Bandarban',
          image: Assets.bandarban,
        ),
        PopularDistrictsComponentsModel(
          title: "Dhaka",
          image: Assets.dhaka,
        ),
        PopularDistrictsComponentsModel(
          title: "Chattogram",
          image: Assets.chattogram,
        ),
        PopularDistrictsComponentsModel(
          title: 'Khulna',
          image: Assets.khulna,
        ),
        PopularDistrictsComponentsModel(
          title: 'Sylhet',
          image: Assets.sylhet,
        ),
      ];
}
