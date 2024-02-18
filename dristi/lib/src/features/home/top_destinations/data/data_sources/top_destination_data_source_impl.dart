import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dristi/src/core/assets/assets.dart';
import 'package:dristi/src/core/loggers/logger.dart';
import 'package:dristi/src/features/home/top_destinations/data/data_sources/top_destination_data_source.dart';
import 'package:dristi/src/features/home/top_destinations/data/model/top_destination_response_model.dart';
import 'package:flutter/services.dart';

class TopDestinationDataSourceImp implements TopDestinationDataSource {
  const TopDestinationDataSourceImp();

  @override
  Future<Response> topDestinationComponents() async {
    try {
      String response =
          await rootBundle.loadString(Assets.topDestinationComponents);
      Log.debug(response.toString());
      final List<dynamic> jsonList = json.decode(response);
      TopDestinationResponseModel splashResponse =
          TopDestinationResponseModel.fromJson(jsonList);

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
