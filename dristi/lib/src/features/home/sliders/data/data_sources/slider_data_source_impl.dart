import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dristi/src/core/assets/assets.dart';
import 'package:dristi/src/core/loggers/logger.dart';
import 'package:dristi/src/features/home/sliders/data/data_sources/slider_data_source.dart';
import 'package:dristi/src/features/home/sliders/data/model/slider_response_model.dart';
import 'package:flutter/services.dart';

class SliderDataSourceImp implements SliderDataSource {
  const SliderDataSourceImp();

  @override
  Future<Response> sliderComponents() async {
    try {
      String response = await rootBundle.loadString(Assets.sliderComponents);
      Log.debug(response.toString());
      final List<dynamic> jsonList = json.decode(response);
      SliderResponseModel splashResponse =
          SliderResponseModel.fromJson(jsonList);

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
