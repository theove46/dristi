import 'package:dristi/src/features/hotel/data/repositories/hotel_repositories_impl.dart';
import 'package:dristi/src/features/hotel/domain/entities/hotel_entities.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dristi/src/features/hotel/data/data_sources/hotel_data_source.dart';

final destinationRepositoryProvider = Provider<HotelRepository>(
  (ref) {
    final dataSource = ref.read(hotelDataSourceProvider);
    return HotelRepositoryImp(dataSource: dataSource);
  },
);

abstract class HotelRepository {
  Future<HotelEntity> getHotelData(String appLanguage, String spotId);

  Future<(String, List<HotelItemsEntity>?)> getHotelItems(String appLanguage);
}
