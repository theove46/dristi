import 'package:dristi/src/features/districts/domain/entities/district_entity.dart';
import 'package:dristi/src/features/districts/domain/repositories/district_repositories.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final districtUseCaseProvider = Provider(
  (ref) {
    return DistrictUseCase(
      ref.read(districtRepositoryProvider),
    );
  },
);

class DistrictUseCase {
  DistrictUseCase(this.repository);

  final DistrictRepository repository;

  Future<(String, List<DistrictEntity>?)> getDistrictComponents() async {
    return repository.getDistrictComponents();
  }
}
