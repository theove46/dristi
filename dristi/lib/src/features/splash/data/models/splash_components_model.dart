import 'dart:ui';

import 'package:dristi/src/core/theme/colors.dart';
import 'package:dristi/src/core/assets/assets.dart';

class SplashComponentsModel {
  SplashComponentsModel({
    required this.title,
    required this.image,
    required this.textColor,
  });

  final String title;
  final String image;
  final Color textColor;

  static List<SplashComponentsModel> fetchAllData() => [
        SplashComponentsModel(
          title: 'Sundarbans',
          image: Assets.sundarbans,
          textColor: UIColors.white,
        ),
        SplashComponentsModel(
          title: "Cox's Bazar",
          image: Assets.coxsBazar,
          textColor: UIColors.white,
        ),
        SplashComponentsModel(
          title: 'Saint Martins',
          image: Assets.saintMartins,
          textColor: UIColors.white,
        ),
        SplashComponentsModel(
          title: 'Nafakhum',
          image: Assets.nafakhum,
          textColor: UIColors.white,
        ),
        SplashComponentsModel(
          title: 'Sajek Valley',
          image: Assets.sajekValley,
          textColor: UIColors.white,
        ),
      ];
}
