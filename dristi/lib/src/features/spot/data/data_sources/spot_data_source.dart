import 'package:dio/dio.dart';
import 'package:dristi/src/features/spot/data/data_sources/spot_data_source_impl.dart';
import 'package:dristi/src/features/spot/data/models/spot_response_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final spotDataSourceProvider = Provider<SpotDataSource>(
  (ref) {
    return SpotDataSourceImp();
  },
);

abstract class SpotDataSource {
  Future<SpotResponseModel> getSpotData(String appLanguage, String spotId);

  Future<Response> getSpotItems(String appLanguage);
}
