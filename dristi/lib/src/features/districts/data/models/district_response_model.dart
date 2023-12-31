import 'package:dristi/src/features/districts/data/models/district_components_model.dart';
import 'package:dristi/src/features/districts/domain/entities/district_entity.dart';

class DistrictResponseModel<T> {
  DistrictResponseModel({
    required this.message,
    required this.data,
  });

  final String message;
  final List<DistrictEntity> data;

  factory DistrictResponseModel.fromDistrictComponentsModel(
      List<DistrictsComponentsModel> districtComponents) {
    List<DistrictEntity> convertedData = districtComponents
        .map((districtModel) => DistrictEntity(
              title: districtModel.title.toString(),
              division: districtModel.division.toString(),
            ))
        .toList();

    return DistrictResponseModel(
      message: '',
      data: convertedData,
    );
  }
}
