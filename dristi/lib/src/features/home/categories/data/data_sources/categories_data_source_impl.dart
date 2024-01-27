import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dristi/src/core/assets/assets.dart';
import 'package:dristi/src/core/utils/loggers/logger.dart';
import 'package:dristi/src/features/home/categories/data/data_sources/categories_data_source.dart';
import 'package:dristi/src/features/home/categories/data/model/categories_response_model.dart';
import 'package:flutter/services.dart';

class CategoriesDataSourceImp implements CategoriesDataSource {
  const CategoriesDataSourceImp();

  @override
  Future<Response> categoriesComponents() async {
    try {
      String response =
          await rootBundle.loadString(Assets.categoriesComponents);
      Log.debug(response.toString());
      final List<dynamic> jsonList = json.decode(response);
      CategoriesResponseModel splashResponse =
          CategoriesResponseModel.fromJson(jsonList);

      return Response(
        requestOptions: RequestOptions(),
        statusMessage: '',
        data: splashResponse.data,
      );
    } catch (error) {
      return Response(
        requestOptions: RequestOptions(),
        statusMessage: 'Error loading data: $error',
        data: null,
      );
    }
  }
}
