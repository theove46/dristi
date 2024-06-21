import 'package:dristi/src/features/spot/data/data_sources/spot_items_data_source.dart';
import 'package:dristi/src/features/spot/domain/entities/spot_item_entities.dart';
import 'package:dristi/src/features/spot/domain/repositories/spot_items_repositories.dart';

class SpotItemsRepositoryImp implements SpotItemsRepository {
  const SpotItemsRepositoryImp({
    required this.dataSource,
  });

  final SpotItemsDataSource dataSource;

  @override
  Future<(String, List<SpotItemsEntity>?)> getSpotItemsComponents(
      String appLanguage) async {
    final response = await dataSource.spotItemsComponents(appLanguage);

    return Future.value(
        (response.statusMessage!, response.data as List<SpotItemsEntity>?));
  }
}
