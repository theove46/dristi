import 'package:dristi/src/features/home/domain/entities/categories_entity.dart';
import 'package:dristi/src/features/home/domain/repositories/categories_repositories.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final categoriesUseCaseProvider = Provider(
  (ref) {
    return CategoriesUseCase(
      ref.read(categoriesRepositoryProvider),
    );
  },
);

class CategoriesUseCase {
  CategoriesUseCase(
    this.categoriesRepository,
  );

  final CategoriesRepository categoriesRepository;

  Future<(String, List<CategoriesEntity>?)> getCategoriesComponents() async {
    return categoriesRepository.getCategoriesComponents();
  }
}
