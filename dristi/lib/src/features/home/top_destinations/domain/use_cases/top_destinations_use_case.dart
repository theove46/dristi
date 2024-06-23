import 'package:dristi/src/features/destinations_list/domain/entities/destinations_list_entity.dart';
import 'package:dristi/src/features/home/top_destinations/domain/repositories/top_destinations_repositories.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final topDestinationsUseCaseProvider = Provider(
  (ref) {
    return TopDestinationsUseCase(
      ref.read(topDestinationsRepositoryProvider),
    );
  },
);

class TopDestinationsUseCase {
  TopDestinationsUseCase(this.repository);

  final TopDestinationsRepository repository;

  Future<List<DestinationsListEntity>> getTopDestinationsComponents(
      String appLanguage) async {
    return repository.getTopDestinationsComponents(appLanguage);
  }
}
