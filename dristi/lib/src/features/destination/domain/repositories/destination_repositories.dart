import 'package:dristi/src/features/destination/data/data_sources/destination_data_source.dart';
import 'package:dristi/src/features/destination/data/repositories/destination_repositories_impl.dart';
import 'package:dristi/src/features/destination/domain/entities/destination_entities.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final destinationRepositoryProvider = Provider<DestinationRepository>(
  (ref) {
    final dataSource = ref.read(destinationDataSourceProvider);
    return DestinationRepositoryImp(dataSource: dataSource);
  },
);

abstract class DestinationRepository {
  Future<DestinationEntity> getDestinationData(String appLanguage, String id);

  Future<(String, List<DestinationItemsEntity>?)> getDestinationItems(
      String appLanguage);
}
