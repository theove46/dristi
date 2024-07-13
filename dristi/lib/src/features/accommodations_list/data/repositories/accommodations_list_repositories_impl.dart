import 'package:dristi/src/features/accommodations_list/data/data_sources/accommodations_list_data_source.dart';
import 'package:dristi/src/features/accommodations_list/domain/entities/accommodations_list_entity.dart';
import 'package:dristi/src/features/accommodations_list/domain/repositories/accommodations_list_repositories.dart';

class AccommodationsListRepositoryImp implements AccommodationsListRepository {
  const AccommodationsListRepositoryImp({
    required this.dataSource,
  });

  final AccommodationsListDataSource dataSource;

  @override
  Future<List<AccommodationsListEntity>> getAccommodationsListComponents(
      String appLanguage) async {
    final response =
        await dataSource.getAccommodationsListComponents(appLanguage);

    return response.response;
  }
}
