import 'package:dristi/src/features/home/domain/entities/popular_districts_entity.dart';
import 'package:dristi/src/features/home/domain/repositories/popular_districts_repositories.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final popularDistrictUseCaseProvider = Provider(
  (ref) {
    return PopularDistrictUseCase(
      ref.read(popularDistrictRepositoryProvider),
    );
  },
);

class PopularDistrictUseCase {
  PopularDistrictUseCase(this.repository);

  final PopularDistrictRepository repository;

  Future<(String, List<PopularDistrictEntity>?)>
      getPopularDistrictComponents() async {
    return repository.getPopularDistrictComponents();
  }
}
