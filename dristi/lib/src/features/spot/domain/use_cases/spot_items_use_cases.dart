import 'package:dristi/src/features/spot/domain/entities/spot_item_entities.dart';
import 'package:dristi/src/features/spot/domain/repositories/spot_items_repositories.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final spotItemsUseCaseProvider = Provider(
  (ref) {
    return SpotItemsUseCase(
      ref.read(spotItemsRepositoryProvider),
    );
  },
);

class SpotItemsUseCase {
  SpotItemsUseCase(this.repository);

  final SpotItemsRepository repository;

  Future<(String, List<SpotItemsEntity>?)> getSpotItemsComponents() async {
    return repository.getSpotItemsComponents();
  }
}
