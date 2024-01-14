import 'package:dio/dio.dart';
import 'package:dristi/src/features/home/data/data_sources/categories/categories_data_source.dart';
import 'package:dristi/src/features/home/data/model/categories/categories_components_model.dart';
import 'package:dristi/src/features/home/data/model/categories/categories_response_model.dart';

class CategoriesDataSourceImp implements CategoriesDataSource {
  const CategoriesDataSourceImp();

  @override
  Future<Response> categoriesComponents() async {
    List<CategoriesComponentsModel> categoriesComponents =
        CategoriesComponentsModel.fetchAllData();

    CategoriesResponseModel response =
        CategoriesResponseModel.fromCategoriesComponentsModel(
            categoriesComponents);

    return Response(
      requestOptions: RequestOptions(),
      statusMessage: response.message,
      data: response.data,
    );
  }
}
