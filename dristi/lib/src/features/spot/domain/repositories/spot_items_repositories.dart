import 'package:dristi/src/features/spot/data/data_sources/spot_items_data_source.dart';
import 'package:dristi/src/features/spot/data/repositories/spot_items_repositories_impl.dart';
import 'package:dristi/src/features/spot/domain/entities/spot_item_entities.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final spotItemsRepositoryProvider = Provider<SpotItemsRepository>(
  (ref) {
    final dataSource = ref.read(spotItemsDataSourceProvider);
    return SpotItemsRepositoryImp(dataSource: dataSource);
  },
);

abstract class SpotItemsRepository {
  Future<(String, List<SpotItemsEntity>?)> getSpotItemsComponents();
}
