import 'package:dio/dio.dart';
import 'package:dristi/src/features/destinations/data/data_sources/destinations_data_source_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final destinationDataSourceProvider = Provider<DestinationDataSource>(
  (ref) {
    return const DestinationDataSourceImp();
  },
);

abstract class DestinationDataSource {
  Future<Response> destinationComponents();
}
