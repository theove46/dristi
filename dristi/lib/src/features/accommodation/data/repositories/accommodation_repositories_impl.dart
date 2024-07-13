import 'package:dristi/src/features/accommodation/data/data_sources/accommodation_data_source.dart';
import 'package:dristi/src/features/accommodation/domain/entities/accommodation_entities.dart';
import 'package:dristi/src/features/accommodation/domain/repositories/accommodation_repositories.dart';

class AccommodationRepositoryImp implements AccommodationRepository {
  const AccommodationRepositoryImp({
    required this.dataSource,
  });

  final AccommodationDataSource dataSource;

  @override
  Future<AccommodationEntity> getAccommodationData(
      String appLanguage, String id) async {
    final response = await dataSource.getAccommodationData(appLanguage, id);

    return response.response;
  }
}
