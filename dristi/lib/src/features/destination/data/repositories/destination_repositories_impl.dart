import 'package:dristi/src/features/destination/data/data_sources/destination_data_source.dart';
import 'package:dristi/src/features/destination/domain/entities/destination_entities.dart';
import 'package:dristi/src/features/destination/domain/repositories/destination_repositories.dart';

class DestinationRepositoryImp implements DestinationRepository {
  const DestinationRepositoryImp({
    required this.dataSource,
  });

  final DestinationDataSource dataSource;

  @override
  Future<DestinationEntity> getDestinationData(
      String appLanguage, String id) async {
    final response = await dataSource.getDestinationData(appLanguage, id);

    return response.destination;
  }

  @override
  Future<(String, List<DestinationItemsEntity>?)> getDestinationItems(
      String appLanguage) async {
    final response = await dataSource.getDestinationItems(appLanguage);

    return Future.value((
      response.statusMessage!,
      response.data as List<DestinationItemsEntity>?
    ));
  }
}
