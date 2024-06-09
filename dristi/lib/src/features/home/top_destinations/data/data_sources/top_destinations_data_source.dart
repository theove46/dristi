import 'package:dristi/src/features/destinations/data/models/destination_response_model.dart';
import 'package:dristi/src/features/home/top_destinations/data/data_sources/top_destinations_data_source_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final topDestinationsDataSourceProvider = Provider<TopDestinationsDataSource>(
  (ref) {
    return TopDestinationsDataSourceImp();
  },
);

abstract class TopDestinationsDataSource {
  Future<DestinationsResponseModel> getTopDestinationsComponents();
}
