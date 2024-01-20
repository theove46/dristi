import 'package:dristi/src/features/home/categories/data/data_sources/categories_data_source.dart';
import 'package:dristi/src/features/home/categories/data/repositories/categories_repositories_impl.dart';
import 'package:dristi/src/features/home/categories/domain/entity/categories_entity.dart';
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
