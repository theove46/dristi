import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dristi/src/core/constants/app_assets.dart';
import 'package:dristi/src/core/loggers/logger.dart';
import 'package:dristi/src/features/on_boarding/data/data_sources/on_boarding_data_source.dart';
import 'package:dristi/src/features/on_boarding/data/models/on_boarding_response_model.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';

class OnBoardingDataSourceImp implements OnBoardingDataSource {
  OnBoardingDataSourceImp();

  late Box<bool> _settingsBox;
  static const String _boxName = 'appSettings';
  static const String _flagName = 'isFirstTime';

  Future<void> initHive() async {
    await Hive.openBox<bool>(_boxName);
    _settingsBox = Hive.box<bool>(_boxName);
  }

  @override
  Future<void> setFirstTimeStatusFalse() async {
    await initHive();
    await _settingsBox.put(_flagName, false);
  }

  @override
  Future<bool> getFirstTimeStatus() async {
    final settingsBox = await Hive.openBox<bool>(_boxName);
    bool? isFirstTime = settingsBox.get(_flagName);
    return isFirstTime ?? true;
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
