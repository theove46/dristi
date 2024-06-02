import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dristi/src/core/constants/app_assets.dart';
import 'package:dristi/src/core/loggers/logger.dart';
import 'package:dristi/src/features/districts/data/data_sources/districts_data_source.dart';
import 'package:dristi/src/features/districts/data/models/district_response_model.dart';
import 'package:dristi/src/features/districts/domain/entities/district_entity.dart';
import 'package:flutter/services.dart';

class DistrictDataSourceImp implements DistrictDataSource {
  const DistrictDataSourceImp();

  @override
  Future<Response> getDistrictComponents({required String searchKey}) async {
    try {
      String response = await rootBundle.loadString(Assets.districtComponents);
      Log.debug(response.toString());
      final List<dynamic> jsonList = json.decode(response);
      DistrictResponseModel districtResponse =
          DistrictResponseModel.fromJson(jsonList);

      List<DistrictEntity>? fetchResult = districtResponse.data.where((u) {
        var checkTitle = u.title.toLowerCase();
        var checkDivision = u.division.toLowerCase();
        return checkTitle.contains(searchKey.toLowerCase()) ||
            checkDivision.contains(searchKey.toLowerCase());
      }).toList();

      return Response(
        requestOptions: RequestOptions(),
        statusMessage: '',
        data: fetchResult,
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
