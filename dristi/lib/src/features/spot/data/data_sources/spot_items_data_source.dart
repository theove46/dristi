import 'package:dio/dio.dart';
import 'package:dristi/src/features/spot/data/data_sources/spot_items_data_source_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final spotItemsDataSourceProvider = Provider<SpotItemsDataSource>(
  (ref) {
    return const SpotItemsDataSourceImp();
  },
);

abstract class SpotItemsDataSource {
  Future<Response> spotItemsComponents();
}
