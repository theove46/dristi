import 'package:dristi/src/features/destinations/domain/entities/destination_entity.dart';
import 'package:dristi/src/features/home/sliders/data/data_sources/slider_data_source.dart';
import 'package:dristi/src/features/home/sliders/data/repositories/slider_repositories_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final sliderRepositoryProvider = Provider<SliderRepository>(
  (ref) {
    final dataSource = ref.read(sliderDataSourceProvider);
    return SliderRepositoryImp(dataSource: dataSource);
  },
);

abstract class SliderRepository {
  Future<List<DestinationEntity>> getSliderComponents(String appLanguage);
}
