import 'package:dristi/src/features/home/categories/domain/entity/categories_entity.dart';
import 'package:dristi/src/features/home/categories/domain/repositories/categories_repositories.dart';
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

  Future<List<CategoryEntity>> getCategoriesComponents() async {
    return categoriesRepository.getCategoriesComponents();
  }
}
