import 'package:dristi/src/features/accommodations_list/data/data_sources/accommodations_list_data_source.dart';
import 'package:dristi/src/features/accommodations_list/data/repositories/accommodations_list_repositories_impl.dart';
import 'package:dristi/src/features/accommodations_list/domain/entities/accommodations_list_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final accommodationsListRepositoryProvider =
    Provider<AccommodationsListRepository>(
  (ref) {
    final dataSource = ref.read(accommodationsListDataSourceProvider);
    return AccommodationsListRepositoryImp(dataSource: dataSource);
  },
);

abstract class AccommodationsListRepository {
  Future<List<AccommodationsListEntity>> getAccommodationsListComponents(
      String appLanguage);
}
