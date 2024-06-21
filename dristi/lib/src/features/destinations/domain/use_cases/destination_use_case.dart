import 'package:dristi/src/features/destinations/domain/entities/destination_entity.dart';
import 'package:dristi/src/features/destinations/domain/repositories/destination_repositories.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final destinationsUseCaseProvider = Provider(
  (ref) {
    return DestinationsUseCase(
      ref.read(destinationsRepositoryProvider),
    );
  },
);

class DestinationsUseCase {
  DestinationsUseCase(this.repository);

  final DestinationsRepository repository;

  Future<List<DestinationEntity>> getDestinationsComponents(
      String appLanguage) async {
    return repository.getDestinationsComponents(appLanguage);
  }
}
