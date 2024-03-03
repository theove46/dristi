import 'package:dristi/src/features/home/sliders/data/data_sources/slider_data_source.dart';
import 'package:dristi/src/features/home/sliders/domain/entity/slider_entity.dart';
import 'package:dristi/src/features/home/sliders/domain/repositories/slider_repositories.dart';

class SliderRepositoryImp implements SliderRepository {
  const SliderRepositoryImp({
    required this.dataSource,
  });

  final SliderDataSource dataSource;

  @override
  Future<List<SliderEntity>> getSliderComponents() async {
    final response = await dataSource.sliderComponents();

    return response.sliderItems;
  }
}
