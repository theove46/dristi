import 'package:dio/dio.dart';
import 'package:dristi/src/core/cache/cache_service.dart';
import 'package:dristi/src/features/on_boarding/data/data_sources/on_boarding_data_source_impl.dart';
import 'package:dristi/src/features/on_boarding/data/models/on_boarding_response_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final onBoardingDataSourceProvider = Provider<OnBoardingDataSource>(
  (ref) {
    final cacheService = ref.read(cacheServiceProvider);
    return OnBoardingDataSourceImp(cacheService: cacheService);
  },
);

abstract class OnBoardingDataSource {
  Future<void> setFirstTimeStatusFalse();

  Future<bool> getFirstTimeStatus();

  Future<OnBoardingResponseModel> onBoardingComponents();

  Future<Response> buttonSubmit();
}
