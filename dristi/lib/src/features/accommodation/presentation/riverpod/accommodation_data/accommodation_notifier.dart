import 'package:dristi/src/core/loggers/logger.dart';
import 'package:dristi/src/features/accommodation/domain/use_cases/accommodation_use_cases.dart';
import 'package:dristi/src/features/accommodation/presentation/riverpod/accommodation_data/accommodation_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AccommodationNotifier extends Notifier<AccommodationState> {
  late AccommodationUseCase useCase;

  @override
  AccommodationState build() {
    useCase = ref.read(accommodationUseCaseProvider);
    return const AccommodationState();
  }

  Future<void> getAccommodationData(String appLanguage, String id) async {
    try {
      state = state.copyWith(
        status: AccommodationStatus.loading,
      );

      final response = await useCase.getAccommodationData(appLanguage, id);

      if (response.id.isNotEmpty) {
        state = state.copyWith(
          data: response,
          status: AccommodationStatus.success,
        );
      } else {
        state = state.copyWith(
          status: AccommodationStatus.failure,
        );
      }
    } catch (e, stackTrace) {
      Log.error(e.toString());
      Log.error(stackTrace.toString());

      state = state.copyWith(
        status: AccommodationStatus.failure,
      );
    }
  }
}
