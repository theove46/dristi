import 'package:dristi/src/core/loggers/logger.dart';
import 'package:dristi/src/features/hotel/domain/use_cases/hotel_use_cases.dart';
import 'package:dristi/src/features/hotel/presentation/riverpod/hotel_data/hotel_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HotelNotifier extends Notifier<HotelState> {
  late HotelUseCase useCase;

  @override
  HotelState build() {
    useCase = ref.read(hotelUseCaseProvider);
    return const HotelState();
  }

  Future<void> getHotelData(String appLanguage, String spotId) async {
    try {
      state = state.copyWith(
        status: HotelStatus.loading,
      );

      final response = await useCase.getHotelData(appLanguage, spotId);

      if (response.id.isNotEmpty) {
        state = state.copyWith(
          data: response,
          status: HotelStatus.success,
        );
      } else {
        state = state.copyWith(
          status: HotelStatus.failure,
        );
      }
    } catch (e, stackTrace) {
      Log.error(e.toString());
      Log.error(stackTrace.toString());

      state = state.copyWith(
        status: HotelStatus.failure,
      );
    }
  }
}
