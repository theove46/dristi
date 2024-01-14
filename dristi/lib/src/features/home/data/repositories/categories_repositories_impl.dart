import 'package:dristi/src/features/home/data/data_sources/categories/categories_data_source.dart';
import 'package:dristi/src/features/home/domain/entities/categories_entity.dart';
import 'package:dristi/src/features/home/domain/repositories/categories_repositories.dart';

class CategoriesRepositoryImp implements CategoriesRepository {
  const CategoriesRepositoryImp({
    required this.dataSource,
  });

  final CategoriesDataSource dataSource;

  @override
  Future<(String, List<CategoriesEntity>?)> getCategoriesComponents() async {
    final response = await dataSource.categoriesComponents();

    return Future.value(
        (response.statusMessage!, response.data as List<CategoriesEntity>?));
  }
}
