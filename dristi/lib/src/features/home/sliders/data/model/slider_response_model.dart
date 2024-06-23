// import 'package:dristi/src/features/destinations_list/domain/entities/hotels_list_entity.dart';
// import 'package:dristi/src/features/home/sliders/domain/entity/slider_entity.dart';
//
// class SliderResponseModel {
//   SliderResponseModel(this.sliderItems);
//
//   SliderResponseModel.fromJson({
//     required List<dynamic> json,
//   }) {
//     sliderItems = <DestinationEntity>[];
//     for (var item in json) {
//       sliderItems.add(SliderData.fromJson(item));
//     }
//   }
//
//   List<DestinationEntity> sliderItems = <DestinationEntity>[];
// }
//
// class SliderData extends DestinationEntity {
//   String? sliderTitle;
//   String? sliderImage;
//
//   SliderData({
//     this.sliderTitle,
//     this.sliderImage,
//   }) : super(
//           title: sliderTitle ?? "",
//           image: sliderImage ?? "",
//         );
//
//   factory SliderData.fromJson(dynamic json) {
//     return SliderData(
//       sliderTitle: json['title'],
//       sliderImage: json['image'],
//     );
//   }
// }
