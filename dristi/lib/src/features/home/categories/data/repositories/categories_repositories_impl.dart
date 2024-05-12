import 'package:dristi/src/features/home/categories/data/data_sources/categories_data_source.dart';
import 'package:dristi/src/features/home/categories/domain/entity/categories_entity.dart';
import 'package:dristi/src/features/home/categories/domain/repositories/categories_repositories.dart';

class CategoriesRepositoryImp implements CategoriesRepository {
  const CategoriesRepositoryImp({
    required this.dataSource,
  });

  final CategoriesDataSource dataSource;

  @override
  Future<List<CategoryEntity>> getCategoriesComponents() async {
    final response = await dataSource.categoriesComponents();

    return response.categoryItems;
  }
}
