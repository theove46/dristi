import 'package:dristi/src/features/accommodation/data/data_sources/accommodation_data_source_impl.dart';
import 'package:dristi/src/features/accommodation/data/models/accommodation_response_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final accommodationDataSourceProvider = Provider<AccommodationDataSource>(
  (ref) {
    return AccommodationDataSourceImp();
  },
);

abstract class AccommodationDataSource {
  Future<AccommodationResponseModel> getAccommodationData(
      String appLanguage, String spotId);
}
