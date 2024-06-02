import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dristi/src/core/cache/cache_service.dart';
import 'package:dristi/src/core/constants/app_assets.dart';
import 'package:dristi/src/core/loggers/logger.dart';
import 'package:dristi/src/features/on_boarding/data/data_sources/on_boarding_data_source.dart';
import 'package:dristi/src/features/on_boarding/data/models/on_boarding_response_model.dart';
import 'package:flutter/services.dart';

class OnBoardingDataSourceImp implements OnBoardingDataSource {
  final CacheService cacheService;

  OnBoardingDataSourceImp({required this.cacheService});

  @override
  Future<void> setFirstTimeStatusFalse() async {
    await cacheService.setFirstTimeOnBoardingFalse();
  }

  @override
  Future<bool> getFirstTimeStatus() async {
    return await cacheService.getFirstTimeStatus();
  }

  @override
  Future<OnBoardingResponseModel> onBoardingComponents() async {
    String response = await rootBundle.loadString(Assets.onBoardingComponents);
    Log.debug(response.toString());
    final List<dynamic> jsonList = json.decode(response);

    try {
      OnBoardingResponseModel onBoardingResponse =
          OnBoardingResponseModel.fromJson(json: jsonList);

      return onBoardingResponse;
    } catch (error) {
      rethrow;
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
