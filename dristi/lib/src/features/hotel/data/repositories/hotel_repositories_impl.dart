import 'package:dristi/src/features/hotel/data/data_sources/hotel_data_source.dart';
import 'package:dristi/src/features/hotel/domain/entities/hotel_entities.dart';
import 'package:dristi/src/features/hotel/domain/repositories/hotel_repositories.dart';

class HotelRepositoryImp implements HotelRepository {
  const HotelRepositoryImp({
    required this.dataSource,
  });

  final HotelDataSource dataSource;

  @override
  Future<HotelEntity> getHotelData(String appLanguage, String spotId) async {
    final response = await dataSource.getHotelData(appLanguage, spotId);

    return response.hotel;
  }

  @override
  Future<(String, List<HotelItemsEntity>?)> getHotelItems(
      String appLanguage) async {
    final response = await dataSource.getHotelItems(appLanguage);

    return Future.value(
        (response.statusMessage!, response.data as List<HotelItemsEntity>?));
  }
}
