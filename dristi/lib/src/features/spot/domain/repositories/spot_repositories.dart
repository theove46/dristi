import 'package:dristi/src/features/spot/data/data_sources/spot_data_source.dart';
import 'package:dristi/src/features/spot/data/repositories/spot_repositories_impl.dart';
import 'package:dristi/src/features/spot/domain/entities/spot_entities.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final spotRepositoryProvider = Provider<SpotRepository>(
  (ref) {
    final dataSource = ref.read(spotDataSourceProvider);
    return SpotRepositoryImp(dataSource: dataSource);
  },
);

abstract class SpotRepository {
  Future<(String, List<SpotItemsEntity>?)> getSpotItems(String appLanguage);
}
