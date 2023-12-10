import 'dart:ui';

import 'package:dristi/src/core/theme/colors.dart';
import 'package:dristi/src/core/assets/assets.dart';

class SplashModel {
  SplashModel({
    required this.title,
    required this.image,
    required this.textColor,
  });

  final String title;
  final String image;
  final Color textColor;

  static List<SplashModel> fetchAllData() => [
        SplashModel(
          title: 'Sundarbans',
          image: Assets.sundarbans,
          textColor: UIColors.white,
        ),
        SplashModel(
          title: "Cox's Bazar",
          image: Assets.coxsBazar,
          textColor: UIColors.white,
        ),
        SplashModel(
          title: 'Saint Martins',
          image: Assets.saintMartins,
          textColor: UIColors.white,
        ),
        SplashModel(
          title: 'Nafakhum',
          image: Assets.nafakhum,
          textColor: UIColors.white,
        ),
        SplashModel(
          title: 'Sajek Valley',
          image: Assets.sajekValley,
          textColor: UIColors.white,
        ),
      ];
}
