import 'package:dristi/src/features/destinations_list/domain/entities/destinations_list_entity.dart';
import 'package:dristi/src/features/home/top_destinations/data/data_sources/top_destinations_data_source.dart';
import 'package:dristi/src/features/home/top_destinations/data/repositories/top_destinations_repositories_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final topDestinationsRepositoryProvider = Provider<TopDestinationsRepository>(
  (ref) {
    final dataSource = ref.read(topDestinationsDataSourceProvider);
    return TopDestinationsRepositoryImp(dataSource: dataSource);
  },
);

abstract class TopDestinationsRepository {
  Future<List<DestinationsListEntity>> getTopDestinationsComponents(
      String appLanguage);
}
