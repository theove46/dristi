import 'package:dristi/src/features/destinations_list/data/data_sources/destinations_list_data_source.dart';
import 'package:dristi/src/features/destinations_list/data/repositories/destinations_list_repositories_impl.dart';
import 'package:dristi/src/features/destinations_list/domain/entities/destinations_list_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final destinationsListRepositoryProvider = Provider<DestinationsListRepository>(
  (ref) {
    final dataSource = ref.read(destinationsListDataSourceProvider);
    return DestinationsListRepositoryImp(dataSource: dataSource);
  },
);

abstract class DestinationsListRepository {
  Future<List<DestinationsListEntity>> getDestinationsListComponents(
      String appLanguage);
}
