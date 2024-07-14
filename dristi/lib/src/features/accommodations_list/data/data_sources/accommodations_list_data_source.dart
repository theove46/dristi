import 'package:dristi/src/features/accommodations_list/data/data_sources/accommodations_list_data_source_impl.dart';
import 'package:dristi/src/features/accommodations_list/data/models/accommodations_list_response_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final accommodationsListDataSourceProvider =
    Provider<AccommodationsListDataSource>(
  (ref) {
    return AccommodationsListDataSourceImp();
  },
);

abstract class AccommodationsListDataSource {
  Future<AccommodationsListResponseModel> getAccommodationsListComponents(
      String appLanguage);
}
