import 'package:dristi/src/features/home/popular_districts/data/data_sources/popular_districts_data_source.dart';
import 'package:dristi/src/features/home/popular_districts/domain/entity/popular_districts_entity.dart';
import 'package:dristi/src/features/home/popular_districts/domain/repositories/popular_districts_repositories.dart';

class PopularDistrictRepositoryImp implements PopularDistrictRepository {
  const PopularDistrictRepositoryImp({
    required this.dataSource,
  });

  final PopularDistrictDataSource dataSource;

  @override
  Future<List<PopularDistrictEntity>> getPopularDistrictComponents() async {
    final response = await dataSource.popularDistrictComponents();

    return response.popularDistrictItems;
  }
}
