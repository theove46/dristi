import 'package:dristi/src/features/destinations/data/data_sources/destinations_data_source.dart';
import 'package:dristi/src/features/destinations/domain/entities/destination_entity.dart';
import 'package:dristi/src/features/destinations/domain/repositories/destination_repositories.dart';

class DestinationsRepositoryImp implements DestinationsRepository {
  const DestinationsRepositoryImp({
    required this.dataSource,
  });

  final DestinationsDataSource dataSource;

  @override
  Future<List<DestinationEntity>> getDestinationsComponents() async {
    final response = await dataSource.destinationsComponents();

    return response.destinationsItems;
  }
}
