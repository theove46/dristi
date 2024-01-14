import 'package:dristi/src/features/home/data/data_sources/popular_districts/popular_districts_data_source.dart';
import 'package:dristi/src/features/home/domain/entities/popular_districts_entity.dart';
import 'package:dristi/src/features/home/domain/repositories/popular_districts_repositories.dart';

class PopularDistrictRepositoryImp implements PopularDistrictRepository {
  const PopularDistrictRepositoryImp({
    required this.dataSource,
  });

  final PopularDistrictDataSource dataSource;

  @override
  Future<(String, List<PopularDistrictEntity>?)>
      getPopularDistrictComponents() async {
    final response = await dataSource.popularDistrictComponents();

    return Future.value((
      response.statusMessage!,
      response.data as List<PopularDistrictEntity>?
    ));
  }
}
