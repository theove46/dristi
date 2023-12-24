import 'package:dristi/src/core/assets/assets.dart';

class PopularDistrictsModel {
  PopularDistrictsModel({
    required this.title,
    required this.image,
  });

  final String title;
  final String image;

  static List<PopularDistrictsModel> fetchAllData() => [
        PopularDistrictsModel(
          title: "Cox's Bazar",
          image: Assets.coxsBazar2,
        ),
        PopularDistrictsModel(
          title: 'Bandarban',
          image: Assets.bandarban,
        ),
        PopularDistrictsModel(
          title: "Dhaka",
          image: Assets.dhaka,
        ),
        PopularDistrictsModel(
          title: "Chattogram",
          image: Assets.chattogram,
        ),
        PopularDistrictsModel(
          title: 'Khulna',
          image: Assets.khulna,
        ),
        PopularDistrictsModel(
          title: 'Sylhet',
          image: Assets.sylhet,
        ),
      ];
}
