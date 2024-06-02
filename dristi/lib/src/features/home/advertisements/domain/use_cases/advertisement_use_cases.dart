import 'package:dristi/src/features/home/advertisements/domain/entity/advertisement_entity.dart';
import 'package:dristi/src/features/home/advertisements/domain/repositories/advertisement_repositories.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final advertisementUseCaseProvider = Provider(
  (ref) {
    return AdvertisementUseCase(
      ref.read(advertisementRepositoryProvider),
    );
  },
);

class AdvertisementUseCase {
  AdvertisementUseCase(this.repository);

  final AdvertisementRepository repository;

  Future<List<AdvertisementEntity>> getAdvertisementComponents() async {
    return repository.getAdvertisementComponents();
  }
}
