import 'package:dio/dio.dart';
import 'package:dristi/src/features/spot/data/data_sources/spot_data_source_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final spotDataSourceProvider = Provider<SpotDataSource>(
  (ref) {
    return const SpotDataSourceImp();
  },
);

abstract class SpotDataSource {
  Future<Response> getSpotItems(String appLanguage);
}
