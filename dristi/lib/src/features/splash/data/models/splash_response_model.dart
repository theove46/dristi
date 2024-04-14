import 'package:dristi/src/features/splash/domain/entities/splash_entity.dart';

class SplashResponseModel {
  SplashResponseModel(this.splashItems);

  SplashResponseModel.fromJson({
    required List<dynamic> json,
  }) {
    splashItems = <SplashEntity>[];
    for (var item in json) {
      splashItems.add(SplashData.fromJson(item));
    }
  }

  List<SplashEntity> splashItems = <SplashEntity>[];
}

class SplashData extends SplashEntity {
  String? splashTitle;
  String? splashImage;

  SplashData({
    this.splashTitle,
    this.splashImage,
  }) : super(
          title: splashTitle ?? "",
          image: splashImage ?? "",
        );

  factory SplashData.fromJson(dynamic json) {
    return SplashData(
      splashTitle: json['title'],
      splashImage: json['image'],
    );
  }
}
