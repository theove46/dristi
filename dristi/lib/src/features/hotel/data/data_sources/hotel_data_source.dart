import 'package:dio/dio.dart';
import 'package:dristi/src/features/hotel/data/data_sources/hotel_data_source_impl.dart';
import 'package:dristi/src/features/hotel/data/models/hotel_response_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final hotelDataSourceProvider = Provider<HotelDataSource>(
  (ref) {
    return HotelDataSourceImp();
  },
);

abstract class HotelDataSource {
  Future<HotelResponseModel> getHotelData(String appLanguage, String spotId);

  Future<Response> getHotelItems(String appLanguage);
}
