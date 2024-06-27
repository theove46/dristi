import 'package:dristi/src/features/destinations_list/domain/entities/destinations_list_entity.dart';
import 'package:dristi/src/features/home/sliders/data/data_sources/slider_data_source.dart';
import 'package:dristi/src/features/home/sliders/domain/repositories/slider_repositories.dart';

class SliderRepositoryImp implements SliderRepository {
  const SliderRepositoryImp({
    required this.dataSource,
  });

  final SliderDataSource dataSource;

  @override
  Future<List<DestinationsListEntity>> getSliderComponents(
      String appLanguage) async {
    final response = await dataSource.sliderComponents(appLanguage);

    return response.destinationsListItems;
  }
}
