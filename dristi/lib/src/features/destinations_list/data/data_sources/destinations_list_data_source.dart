import 'package:dristi/src/features/destinations_list/data/data_sources/destinations_list_data_source_impl.dart';
import 'package:dristi/src/features/destinations_list/data/models/destinations_list_response_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final destinationsListDataSourceProvider = Provider<DestinationsListDataSource>(
  (ref) {
    return DestinationsListDataSourceImp();
  },
);

abstract class DestinationsListDataSource {
  Future<DestinationsListResponseModel> getDestinationsListComponents(
      String appLanguage);
}
