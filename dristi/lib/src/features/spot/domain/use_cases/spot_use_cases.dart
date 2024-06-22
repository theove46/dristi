import 'package:dristi/src/features/spot/domain/entities/spot_entities.dart';
import 'package:dristi/src/features/spot/domain/repositories/spot_repositories.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final spotUseCaseProvider = Provider(
  (ref) {
    return SpotUseCase(
      ref.read(spotRepositoryProvider),
    );
  },
);

class SpotUseCase {
  SpotUseCase(this.repository);

  final SpotRepository repository;

  Future<(String, List<SpotItemsEntity>?)> getSpotItems(
      String appLanguage) async {
    return repository.getSpotItems(appLanguage);
  }
}
