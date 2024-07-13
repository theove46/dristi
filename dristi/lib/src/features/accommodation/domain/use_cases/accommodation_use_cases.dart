import 'package:dristi/src/features/accommodation/domain/entities/accommodation_entities.dart';
import 'package:dristi/src/features/accommodation/domain/repositories/accommodation_repositories.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final accommodationUseCaseProvider = Provider(
  (ref) {
    return AccommodationUseCase(
      ref.read(accommodationRepositoryProvider),
    );
  },
);

class AccommodationUseCase {
  AccommodationUseCase(this.repository);

  final AccommodationRepository repository;

  Future<AccommodationEntity> getAccommodationData(
      String appLanguage, String id) async {
    return repository.getAccommodationData(appLanguage, id);
  }
}
