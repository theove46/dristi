import 'package:dristi/src/features/destinations/domain/entities/destination_entity.dart';
import 'package:dristi/src/features/destinations/domain/repositories/destination_repositories.dart';
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

  Future<(String, List<DestinationEntity>?)> getDestinationComponents() async {
    return repository.getDestinationComponents();
  }
}
