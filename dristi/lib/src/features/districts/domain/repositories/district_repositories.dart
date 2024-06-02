import 'package:dristi/src/features/districts/data/data_sources/districts_data_source.dart';
import 'package:dristi/src/features/districts/data/repositories/district_repositories_impl.dart';
import 'package:dristi/src/features/districts/domain/entities/district_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final districtRepositoryProvider = Provider<DistrictRepository>(
  (ref) {
    final dataSource = ref.read(districtDataSourceProvider);
    return DistrictRepositoryImp(dataSource: dataSource);
  },
);

abstract class DistrictRepository {
  Future<(String, List<DistrictEntity>?)> getDistrictComponents(
      {required String searchKey});
}
