import 'package:dristi/src/features/destination/domain/entities/destination_entities.dart';
import 'package:dristi/src/features/destination/domain/repositories/destination_repositories.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final destinationUseCaseProvider = Provider(
  (ref) {
    return DestinationUseCase(
      ref.read(destinationRepositoryProvider),
    );
  },
);

class DestinationUseCase {
  DestinationUseCase(this.repository);

  final DestinationRepository repository;

  Future<DestinationEntity> getDestinationData(
      String appLanguage, String spotId) async {
    return repository.getDestinationData(appLanguage, spotId);
  }

  Future<(String, List<DestinationItemsEntity>?)> getDestinationItems(
      String appLanguage) async {
    return repository.getDestinationItems(appLanguage);
  }
}
