import 'package:dio/dio.dart';
import 'package:dristi/src/features/districts/data/data_sources/districts_data_source_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final districtDataSourceProvider = Provider<DistrictDataSource>(
  (ref) {
    return const DistrictDataSourceImp();
  },
);

abstract class DistrictDataSource {
  Future<Response> getDistrictComponents();
}
