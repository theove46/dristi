import 'package:dristi/src/features/home/sliders/data/data_sources/slider_data_source.dart';
import 'package:dristi/src/features/home/sliders/data/repositories/slider_repositories_impl.dart';
import 'package:dristi/src/features/home/sliders/domain/entity/slider_entity.dart';
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
