import 'package:dio/dio.dart';
import 'package:dristi/src/features/home/data/data_sources/popular_districts/popular_districts_data_source_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final popularDistrictDataSourceProvider = Provider<PopularDistrictDataSource>(
  (ref) {
    return const PopularDistrictDataSourceImp();
  },
);

abstract class PopularDistrictDataSource {
  Future<Response> popularDistrictComponents();
}
