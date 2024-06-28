import 'package:dio/dio.dart';
import 'package:dristi/src/features/destination/data/data_sources/destination_data_source_impl.dart';
import 'package:dristi/src/features/destination/data/models/destination_response_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final destinationDataSourceProvider = Provider<DestinationDataSource>(
  (ref) {
    return DestinationDataSourceImp();
  },
);

abstract class DestinationDataSource {
  Future<DestinationResponseModel> getDestinationData(
      String appLanguage, String spotId);

  Future<Response> getDestinationItems(String appLanguage);
}
