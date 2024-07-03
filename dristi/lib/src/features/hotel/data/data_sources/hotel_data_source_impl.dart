import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dristi/src/core/base/base_remote_source.dart';
import 'package:dristi/src/core/constants/app_assets.dart';
import 'package:dristi/src/core/constants/app_end_points.dart';
import 'package:dristi/src/core/network/dio_provider.dart';
import 'package:dristi/src/features/hotel/data/data_sources/hotel_data_source.dart';
import 'package:dristi/src/features/hotel/data/models/hotel_response_model.dart';
import 'package:flutter/services.dart';

class HotelDataSourceImp extends BaseRemoteSource implements HotelDataSource {
  @override
  Future<HotelResponseModel> getHotelData(String appLanguage, String spotId) {
    final String endpoint =
        '${DioProvider.baseUrl}${API.hotelsAndResorts}${API.language}$appLanguage${'/hr0001.json'}';

    final Future<Response> dioCall = dioClient.get(endpoint);

    try {
      return callApiWithErrorParser(dioCall).then((Response response) {
        return HotelResponseModel.fromJson(json: response.data);
      });
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Response> getHotelItems(String appLanguage) async {
    try {
      String endpoint = appLanguage == 'en'
          ? Assets.spotComponentsEn
          : Assets.spotComponentsBn;

      String response = await rootBundle.loadString(endpoint);
      final List<dynamic> jsonList = json.decode(response);
      HotelItemsResponseModel destinationResponse =
          HotelItemsResponseModel.fromJson(jsonList);

      return Response(
        requestOptions: RequestOptions(),
        statusMessage: '',
        data: destinationResponse.data,
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
