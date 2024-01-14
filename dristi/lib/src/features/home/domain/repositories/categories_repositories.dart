import 'package:dristi/src/features/home/data/data_sources/categories/categories_data_source.dart';
import 'package:dristi/src/features/home/data/repositories/categories_repositories_impl.dart';
import 'package:dristi/src/features/home/domain/entities/categories_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final categoriesRepositoryProvider = Provider<CategoriesRepository>(
  (ref) {
    final dataSource = ref.read(categoriesDataSourceProvider);
    return CategoriesRepositoryImp(dataSource: dataSource);
  },
);

abstract class CategoriesRepository {
  Future<(String, List<CategoriesEntity>?)> getCategoriesComponents();
}
