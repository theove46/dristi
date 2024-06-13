import 'package:dristi/src/core/constants/app_assets.dart';
import 'package:dristi/src/core/constants/app_global_texts.dart';

class AdvertisementEntity {
  String title;
  String url;
  String image;

  AdvertisementEntity({
    required this.title,
    required this.url,
    required this.image,
  });

  AdvertisementEntity.initial()
      : title = TextConstants.appName,
        url = Assets.commonWebUrl,
        image = Assets.advertiseBanner;
}
