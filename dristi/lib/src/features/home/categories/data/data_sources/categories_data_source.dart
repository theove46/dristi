import 'package:dristi/src/features/home/categories/data/data_sources/categories_data_source_impl.dart';
import 'package:dristi/src/features/home/categories/data/model/categories_response_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final categoriesDataSourceProvider = Provider<CategoriesDataSource>(
  (ref) {
    return CategoriesDataSourceImp();
  },
);

abstract class CategoriesDataSource {
  Future<CategoriesResponseModel> categoriesComponents(String appLanguage);
}
