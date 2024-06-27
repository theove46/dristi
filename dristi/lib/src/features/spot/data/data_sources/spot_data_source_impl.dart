import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dristi/src/core/base/base_remote_source.dart';
import 'package:dristi/src/core/constants/app_assets.dart';
import 'package:dristi/src/core/constants/app_end_points.dart';
import 'package:dristi/src/core/network/dio_provider.dart';
import 'package:dristi/src/features/spot/data/data_sources/spot_data_source.dart';
import 'package:dristi/src/features/spot/data/models/spot_response_model.dart';
import 'package:flutter/services.dart';

class SpotDataSourceImp extends BaseRemoteSource implements SpotDataSource {
  @override
  Future<SpotResponseModel> getSpotData(String appLanguage, String spotId) {
    final String endpoint =
        '${DioProvider.baseUrl}${API.spots}${API.language}$appLanguage${'/spot_0001.json'}';

    final Future<Response> dioCall = dioClient.get(endpoint);

    try {
      return callApiWithErrorParser(dioCall).then((Response response) {
        return SpotResponseModel.fromJson(json: response.data);
      });
    } catch (e) {
      rethrow;
    }
  }

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
