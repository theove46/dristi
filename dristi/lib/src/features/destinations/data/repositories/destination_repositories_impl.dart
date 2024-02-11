import 'package:dristi/src/features/destinations/data/data_sources/destinations_data_source.dart';
import 'package:dristi/src/features/destinations/domain/entities/destination_entity.dart';
import 'package:dristi/src/features/destinations/domain/repositories/destination_repositories.dart';

class DestinationRepositoryImp implements DestinationRepository {
  const DestinationRepositoryImp({
    required this.dataSource,
  });

  final DestinationDataSource dataSource;

  @override
  Future<(String, List<DestinationEntity>?)> getDestinationComponents() async {
    final response = await dataSource.destinationComponents();

    return Future.value(
        (response.statusMessage!, response.data as List<DestinationEntity>?));
  }
}
