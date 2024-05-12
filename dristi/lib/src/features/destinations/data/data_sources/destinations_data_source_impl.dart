import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dristi/src/core/assets/assets.dart';
import 'package:dristi/src/core/loggers/logger.dart';
import 'package:dristi/src/features/destinations/data/data_sources/destinations_data_source.dart';
import 'package:dristi/src/features/destinations/data/models/destination_response_model.dart';
import 'package:flutter/services.dart';

class DestinationDataSourceImp implements DestinationDataSource {
  const DestinationDataSourceImp();

  @override
  Future<Response> destinationComponents() async {
    try {
      String response = await rootBundle.loadString(Assets.districtComponents);
      Log.debug(response.toString());
      final List<dynamic> jsonList = json.decode(response);
      DestinationResponseModel destinationResponse =
          DestinationResponseModel.fromJson(jsonList);

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
