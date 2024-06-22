import 'package:dristi/src/features/spot/data/data_sources/spot_data_source.dart';
import 'package:dristi/src/features/spot/domain/entities/spot_entities.dart';
import 'package:dristi/src/features/spot/domain/repositories/spot_repositories.dart';

class SpotRepositoryImp implements SpotRepository {
  const SpotRepositoryImp({
    required this.dataSource,
  });

  final SpotDataSource dataSource;

  @override
  Future<SpotEntity> getSpotData(String appLanguage, String spotId) async {
    final response = await dataSource.getSpotData(appLanguage, spotId);

    return response.spots;
  }

  @override
  Future<(String, List<SpotItemsEntity>?)> getSpotItems(
      String appLanguage) async {
    final response = await dataSource.getSpotItems(appLanguage);

    return Future.value(
        (response.statusMessage!, response.data as List<SpotItemsEntity>?));
  }
}
