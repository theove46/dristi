import 'package:dristi/src/features/accommodation/data/repositories/accommodation_repositories_impl.dart';
import 'package:dristi/src/features/accommodation/domain/entities/accommodation_entities.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dristi/src/features/accommodation/data/data_sources/accommodation_data_source.dart';

final accommodationRepositoryProvider = Provider<AccommodationRepository>(
  (ref) {
    final dataSource = ref.read(accommodationDataSourceProvider);
    return AccommodationRepositoryImp(dataSource: dataSource);
  },
);

abstract class AccommodationRepository {
  Future<AccommodationEntity> getAccommodationData(
      String appLanguage, String spotId);
}
