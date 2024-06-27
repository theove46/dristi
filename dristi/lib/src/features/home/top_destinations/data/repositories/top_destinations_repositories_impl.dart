import 'package:dristi/src/features/destinations_list/domain/entities/destinations_list_entity.dart';
import 'package:dristi/src/features/home/top_destinations/data/data_sources/top_destinations_data_source.dart';
import 'package:dristi/src/features/home/top_destinations/domain/repositories/top_destinations_repositories.dart';

class TopDestinationsRepositoryImp implements TopDestinationsRepository {
  const TopDestinationsRepositoryImp({
    required this.dataSource,
  });

  final TopDestinationsDataSource dataSource;

  @override
  Future<List<DestinationsListEntity>> getTopDestinationsComponents(
      String appLanguage) async {
    final response = await dataSource.getTopDestinationsComponents(appLanguage);

    return response.destinationsListItems;
  }
}
