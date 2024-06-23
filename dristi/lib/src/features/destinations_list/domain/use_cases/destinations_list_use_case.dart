import 'package:dristi/src/features/destinations_list/domain/entities/destinations_list_entity.dart';
import 'package:dristi/src/features/destinations_list/domain/repositories/destinations_list_repositories.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final destinationsListUseCaseProvider = Provider(
  (ref) {
    return DestinationsListUseCase(
      ref.read(destinationsListRepositoryProvider),
    );
  },
);

class DestinationsListUseCase {
  DestinationsListUseCase(this.repository);

  final DestinationsListRepository repository;

  Future<List<DestinationsListEntity>> getDestinationsListComponents(
      String appLanguage) async {
    return repository.getDestinationsListComponents(appLanguage);
  }
}
