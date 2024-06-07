import 'package:dristi/src/features/home/advertisements/data/data_sources/advertisement_data_source.dart';
import 'package:dristi/src/features/home/advertisements/data/repositories/advertisement_repositories_impl.dart';
import 'package:dristi/src/features/home/advertisements/domain/entity/advertisement_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final advertisementRepositoryProvider = Provider<AdvertisementRepository>(
  (ref) {
    final dataSource = ref.read(advertisementDataSourceProvider);
    return AdvertisementRepositoryImp(dataSource: dataSource);
  },
);

abstract class AdvertisementRepository {
  Future<List<MultipleAdvertisementEntity>>
      getMultipleAdvertisementComponents();
}
