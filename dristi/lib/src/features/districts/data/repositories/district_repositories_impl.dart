import 'package:dristi/src/features/districts/data/data_sources/districts_data_source.dart';
import 'package:dristi/src/features/districts/domain/entities/district_entity.dart';
import 'package:dristi/src/features/districts/domain/repositories/district_repositories.dart';

class DistrictRepositoryImp implements DistrictRepository {
  const DistrictRepositoryImp({
    required this.dataSource,
  });

  final DistrictDataSource dataSource;

  @override
  Future<(String, List<DistrictEntity>?)> getDistrictComponents() async {
    final response = await dataSource.districtComponents();

    return Future.value(
        (response.statusMessage!, response.data as List<DistrictEntity>?));
  }
}
