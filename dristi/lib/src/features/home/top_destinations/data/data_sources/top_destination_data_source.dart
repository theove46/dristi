import 'package:dio/dio.dart';
import 'package:dristi/src/features/home/top_destinations/data/data_sources/top_destination_data_source_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final topDestinationDataSourceProvider = Provider<TopDestinationDataSource>(
  (ref) {
    return const TopDestinationDataSourceImp();
  },
);

abstract class TopDestinationDataSource {
  Future<Response> topDestinationComponents();
}
