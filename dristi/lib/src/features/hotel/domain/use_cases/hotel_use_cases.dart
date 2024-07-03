import 'package:dristi/src/features/hotel/domain/entities/hotel_entities.dart';
import 'package:dristi/src/features/hotel/domain/repositories/hotel_repositories.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final hotelUseCaseProvider = Provider(
  (ref) {
    return HotelUseCase(
      ref.read(destinationRepositoryProvider),
    );
  },
);

class HotelUseCase {
  HotelUseCase(this.repository);

  final HotelRepository repository;

  Future<HotelEntity> getHotelData(String appLanguage, String spotId) async {
    return repository.getHotelData(appLanguage, spotId);
  }

  Future<(String, List<HotelItemsEntity>?)> getHotelItems(
      String appLanguage) async {
    return repository.getHotelItems(appLanguage);
  }
}
