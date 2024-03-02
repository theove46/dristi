import 'package:dio/dio.dart';
import 'package:dristi/src/features/splash/data/data_sources/splash_data_source_impl.dart';
import 'package:dristi/src/features/splash/data/models/splash_response_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final splashDataSourceProvider = Provider<SplashDataSource>(
  (ref) {
    return SplashDataSourceImp();
  },
);

abstract class SplashDataSource {
  Future<SplashResponseModel> splashComponents();

  Future<Response> buttonSubmit();
}
