import 'package:dristi/src/features/home/domain/entities/top_destination_entity.dart';
import 'package:dristi/src/features/home/domain/repositories/top_destination_repositories.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final topDestinationsUseCaseProvider = Provider(
  (ref) {
    return TopDestinationsUseCase(
      ref.read(topDestinationRepositoryProvider),
    );
  },
);

class TopDestinationsUseCase {
  TopDestinationsUseCase(this.repository);

  final TopDestinationRepository repository;

  Future<(String, List<TopDestinationEntity>?)>
      topDestinationsComponents() async {
    return repository.getTopDestinationComponents();
  }
}
