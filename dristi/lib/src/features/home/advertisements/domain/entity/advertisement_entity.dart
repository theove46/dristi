import 'package:dristi/src/core/constants/app_assets.dart';
import 'package:dristi/src/core/constants/app_global_texts.dart';

class MultipleAdvertisementEntity {
  String title;
  String url;
  String image;

  MultipleAdvertisementEntity({
    required this.title,
    required this.url,
    required this.image,
  });

  MultipleAdvertisementEntity.initial()
      : title = TextConstants.appName,
        url = Assets.commonWebUrl,
        image = Assets.advertiseBanner;
}
