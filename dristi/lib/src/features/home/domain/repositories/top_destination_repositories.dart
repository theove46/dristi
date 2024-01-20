import 'package:dristi/src/features/home/data/data_sources/top_destinations/top_destination_data_source.dart';
import 'package:dristi/src/features/home/data/repositories/top_destination_repositories_impl.dart';
import 'package:dristi/src/features/home/domain/entities/top_destination_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final topDestinationRepositoryProvider = Provider<TopDestinationRepository>(
  (ref) {
    final dataSource = ref.read(topDestinationDataSourceProvider);
    return TopDestinationRepositoryImp(dataSource: dataSource);
  },
);

abstract class TopDestinationRepository {
  Future<(String, List<TopDestinationEntity>?)> getTopDestinationComponents();
}
