import 'package:dio/dio.dart';
import 'package:dristi/src/features/home/data/data_sources/slider/slider_data_source_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final sliderDataSourceProvider = Provider<SliderDataSource>(
  (ref) {
    return const SliderDataSourceImp();
  },
);

abstract class SliderDataSource {
  Future<Response> sliderComponents();
}
