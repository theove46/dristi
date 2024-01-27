import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dristi/src/core/assets/assets.dart';
import 'package:dristi/src/core/utils/loggers/logger.dart';
import 'package:dristi/src/features/home/popular_districts/data/data_sources/popular_districts_data_source.dart';
import 'package:dristi/src/features/home/popular_districts/data/model/popular_districts_response_model.dart';
import 'package:flutter/services.dart';

class PopularDistrictDataSourceImp implements PopularDistrictDataSource {
  const PopularDistrictDataSourceImp();

  @override
  Future<Response> popularDistrictComponents() async {
    try {
      String response =
          await rootBundle.loadString(Assets.popularDistrictsComponents);
      Log.debug(response.toString());
      final List<dynamic> jsonList = json.decode(response);
      PopularDistrictResponseModel splashResponse =
          PopularDistrictResponseModel.fromJson(jsonList);

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
