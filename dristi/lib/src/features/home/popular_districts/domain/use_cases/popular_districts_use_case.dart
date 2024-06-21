import 'package:dristi/src/features/home/popular_districts/domain/entity/popular_districts_entity.dart';
import 'package:dristi/src/features/home/popular_districts/domain/repositories/popular_districts_repositories.dart';
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

  Future<List<PopularDistrictEntity>> getPopularDistrictComponents(
      String appLanguage) async {
    return repository.getPopularDistrictComponents(appLanguage);
  }
}
