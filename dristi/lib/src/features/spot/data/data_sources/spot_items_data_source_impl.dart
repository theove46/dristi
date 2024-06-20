import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dristi/src/core/constants/app_assets.dart';
import 'package:dristi/src/features/spot/data/data_sources/spot_items_data_source.dart';
import 'package:dristi/src/features/spot/data/models/spot_items_response_model.dart';
import 'package:flutter/services.dart';

class SpotItemsDataSourceImp implements SpotItemsDataSource {
  const SpotItemsDataSourceImp();

  @override
  Future<Response> spotItemsComponents() async {
    try {
      String response = await rootBundle.loadString(Assets.spotComponents);
      final List<dynamic> jsonList = json.decode(response);
      SpotItemResponseModel splashResponse =
          SpotItemResponseModel.fromJson(jsonList);

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
