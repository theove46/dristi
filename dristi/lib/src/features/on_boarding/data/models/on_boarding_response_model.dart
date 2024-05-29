import 'package:dristi/src/features/on_boarding/domain/entities/on_boarding_entity.dart';

class OnBoardingResponseModel {
  OnBoardingResponseModel(this.onBoardingItems);

  OnBoardingResponseModel.fromJson({
    required List<dynamic> json,
  }) {
    onBoardingItems = <OnBoardingEntity>[];
    for (var item in json) {
      onBoardingItems.add(OnBoardingData.fromJson(item));
    }
  }

  List<OnBoardingEntity> onBoardingItems = <OnBoardingEntity>[];
}

class OnBoardingData extends OnBoardingEntity {
  String? onBoardingTitle;
  String? onBoardingImage;

  OnBoardingData({
    this.onBoardingTitle,
    this.onBoardingImage,
  }) : super(
          title: onBoardingTitle ?? "",
          image: onBoardingImage ?? "",
        );

  factory OnBoardingData.fromJson(dynamic json) {
    return OnBoardingData(
      onBoardingTitle: json['title'],
      onBoardingImage: json['image'],
    );
  }
}
