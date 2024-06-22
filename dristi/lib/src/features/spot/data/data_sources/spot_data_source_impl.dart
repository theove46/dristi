import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dristi/src/core/constants/app_assets.dart';
import 'package:dristi/src/features/spot/data/data_sources/spot_data_source.dart';
import 'package:dristi/src/features/spot/data/models/spot_response_model.dart';
import 'package:flutter/services.dart';

class SpotDataSourceImp implements SpotDataSource {
  const SpotDataSourceImp();

  @override
  Future<Response> getSpotItems(String appLanguage) async {
    try {
      String endpoint = appLanguage == 'en'
          ? Assets.spotComponentsEn
          : Assets.spotComponentsBn;

      String response = await rootBundle.loadString(endpoint);
      final List<dynamic> jsonList = json.decode(response);
      SpotItemsResponseModel splashResponse =
          SpotItemsResponseModel.fromJson(jsonList);

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
