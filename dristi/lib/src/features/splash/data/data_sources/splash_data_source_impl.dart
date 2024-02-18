import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dristi/src/core/assets/assets.dart';
import 'package:dristi/src/core/loggers/logger.dart';
import 'package:dristi/src/features/splash/data/data_sources/splash_data_source.dart';
import 'package:dristi/src/features/splash/data/models/splash_response_model.dart';
import 'package:flutter/services.dart';

class SplashDataSourceImp implements SplashDataSource {
  const SplashDataSourceImp();

  @override
  Future<Response> splashComponents() async {
    try {
      String response = await rootBundle.loadString(Assets.splashComponents);
      Log.debug(response.toString());
      final List<dynamic> jsonList = json.decode(response);
      SplashResponseModel splashResponse =
          SplashResponseModel.fromJson(jsonList);

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

  @override
  Future<Response> buttonSubmit() async {
    return Response(
      requestOptions: RequestOptions(),
      statusMessage: '',
    );
  }
}
