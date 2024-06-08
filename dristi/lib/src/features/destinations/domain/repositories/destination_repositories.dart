import 'package:dristi/src/features/destinations/data/data_sources/destinations_data_source.dart';
import 'package:dristi/src/features/destinations/data/repositories/destination_repositories_impl.dart';
import 'package:dristi/src/features/destinations/domain/entities/destination_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final destinationsRepositoryProvider = Provider<DestinationsRepository>(
  (ref) {
    final dataSource = ref.read(destinationsDataSourceProvider);
    return DestinationsRepositoryImp(dataSource: dataSource);
  },
);

abstract class DestinationsRepository {
  Future<List<DestinationEntity>> getDestinationsComponents();
}
