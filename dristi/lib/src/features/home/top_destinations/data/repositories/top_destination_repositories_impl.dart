import 'package:dristi/src/features/home/top_destinations/data/data_sources/top_destination_data_source.dart';
import 'package:dristi/src/features/home/top_destinations/domain/entity/top_destination_entity.dart';
import 'package:dristi/src/features/home/top_destinations/domain/repositories/top_destination_repositories.dart';

class TopDestinationRepositoryImp implements TopDestinationRepository {
  const TopDestinationRepositoryImp({
    required this.dataSource,
  });

  final TopDestinationDataSource dataSource;

  @override
  Future<(String, List<TopDestinationEntity>?)>
      getTopDestinationComponents() async {
    final response = await dataSource.topDestinationComponents();

    return Future.value((
      response.statusMessage!,
      response.data as List<TopDestinationEntity>?
    ));
  }
}
