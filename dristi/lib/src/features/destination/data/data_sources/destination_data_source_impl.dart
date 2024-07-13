import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dristi/src/core/base/base_remote_source.dart';
import 'package:dristi/src/core/constants/app_assets.dart';
import 'package:dristi/src/core/constants/app_end_points.dart';
import 'package:dristi/src/core/network/dio_provider.dart';
import 'package:dristi/src/features/destination/data/data_sources/destination_data_source.dart';
import 'package:dristi/src/features/destination/data/models/destination_response_model.dart';
import 'package:flutter/services.dart';

class DestinationDataSourceImp extends BaseRemoteSource
    implements DestinationDataSource {
  @override
  Future<DestinationResponseModel> getDestinationData(
      String appLanguage, String spotId) {
    final String endpoint =
        '${DioProvider.baseUrl}${API.destination}${API.language}$appLanguage${'/spot_0001.json'}';

    final Future<Response> dioCall = dioClient.get(endpoint);

    try {
      return callApiWithErrorParser(dioCall).then((Response response) {
        return DestinationResponseModel.fromJson(json: response.data);
      });
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Response> getDestinationItems(String appLanguage) async {
    try {
      String endpoint = appLanguage == 'en'
          ? Assets.spotComponentsEn
          : Assets.spotComponentsBn;

      String response = await rootBundle.loadString(endpoint);
      final List<dynamic> jsonList = json.decode(response);
      DestinationItemsResponseModel destinationResponse =
          DestinationItemsResponseModel.fromJson(jsonList);

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
