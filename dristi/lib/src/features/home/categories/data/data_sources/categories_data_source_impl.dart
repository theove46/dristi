import 'package:dio/dio.dart';
import 'package:dristi/src/core/base/base_remote_source.dart';
import 'package:dristi/src/core/constants/app_end_points.dart';
import 'package:dristi/src/core/network/dio_provider.dart';
import 'package:dristi/src/features/home/categories/data/data_sources/categories_data_source.dart';
import 'package:dristi/src/features/home/categories/data/model/categories_response_model.dart';

class CategoriesDataSourceImp extends BaseRemoteSource
    implements CategoriesDataSource {
  @override
  Future<CategoriesResponseModel> categoriesComponents(String appLanguage) {
    final String endpoint =
        '${DioProvider.baseUrl}${API.components}${API.language}$appLanguage${API.categories}';

    final Future<Response> dioCall = dioClient.get(endpoint);

    try {
      return callApiWithErrorParser(dioCall).then((Response response) {
        return CategoriesResponseModel.fromJson(json: response.data);
      });
    } catch (e) {
      rethrow;
    }
  }
}
