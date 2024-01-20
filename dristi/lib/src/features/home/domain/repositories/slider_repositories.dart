import 'package:dristi/src/features/home/data/data_sources/slider/slider_data_source.dart';
import 'package:dristi/src/features/home/data/repositories/slider_repositories_impl.dart';
import 'package:dristi/src/features/home/domain/entities/slider_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final sliderRepositoryProvider = Provider<SliderRepository>(
  (ref) {
    final dataSource = ref.read(sliderDataSourceProvider);
    return SliderRepositoryImp(dataSource: dataSource);
  },
);

abstract class SliderRepository {
  Future<(String, List<SliderEntity>?)> getSliderComponents();
}
