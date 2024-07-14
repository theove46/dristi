import 'package:dristi/src/features/accommodations_list/domain/entities/accommodations_list_entity.dart';
import 'package:dristi/src/features/accommodations_list/domain/repositories/accommodations_list_repositories.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final accommodationsListUseCaseProvider = Provider(
  (ref) {
    return AccommodationsListUseCase(
      ref.read(accommodationsListRepositoryProvider),
    );
  },
);

class AccommodationsListUseCase {
  AccommodationsListUseCase(this.repository);

  final AccommodationsListRepository repository;

  Future<List<AccommodationsListEntity>> getAccommodationsListComponents(
      String appLanguage) async {
    return repository.getAccommodationsListComponents(appLanguage);
  }
}
