import 'package:dristi/src/features/destinations_list/data/data_sources/destinations_list_data_source.dart';
import 'package:dristi/src/features/destinations_list/domain/entities/destinations_list_entity.dart';
import 'package:dristi/src/features/destinations_list/domain/repositories/destinations_list_repositories.dart';

class DestinationsListRepositoryImp implements DestinationsListRepository {
  const DestinationsListRepositoryImp({
    required this.dataSource,
  });

  final DestinationsListDataSource dataSource;

  @override
  Future<List<DestinationsListEntity>> getDestinationsListComponents(
      String appLanguage) async {
    final response =
        await dataSource.getDestinationsListComponents(appLanguage);

    return response.destinationsListItems;
  }
}
