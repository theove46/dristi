import 'package:dio/dio.dart';
import 'package:dristi/src/features/splash/data/data_sources/splash_data_source_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final splashDataSourceProvider = Provider<SplashDataSource>(
  (ref) {
    return const SplashDataSourceImp();
  },
);

abstract class SplashDataSource {
  Future<Response> splashComponents();

  Future<Response> buttonSubmit();
}
