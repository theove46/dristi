import 'package:dristi/src/features/destinations/data/data_sources/destinations_data_source_impl.dart';
import 'package:dristi/src/features/destinations/data/models/destination_response_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final destinationsDataSourceProvider = Provider<DestinationsDataSource>(
  (ref) {
    return DestinationsDataSourceImp();
  },
);

abstract class DestinationsDataSource {
  Future<DestinationsResponseModel> destinationsComponents(String appLanguage);
}
