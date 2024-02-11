import 'package:dristi/src/features/destinations/data/data_sources/destinations_data_source.dart';
import 'package:dristi/src/features/destinations/data/repositories/destination_repositories_impl.dart';
import 'package:dristi/src/features/destinations/domain/entities/destination_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final destinationRepositoryProvider = Provider<DestinationRepository>(
  (ref) {
    final dataSource = ref.read(destinationDataSourceProvider);
    return DestinationRepositoryImp(dataSource: dataSource);
  },
);

abstract class DestinationRepository {
  Future<(String, List<DestinationEntity>?)> getDestinationComponents();
}
