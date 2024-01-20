import 'package:dio/dio.dart';
import 'package:dristi/src/features/home/categories/data/data_sources/categories_data_source_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final categoriesDataSourceProvider = Provider<CategoriesDataSource>(
  (ref) {
    return const CategoriesDataSourceImp();
  },
);

abstract class CategoriesDataSource {
  Future<Response> categoriesComponents();
}
