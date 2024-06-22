import 'package:dristi/src/core/loggers/logger.dart';
import 'package:dristi/src/features/spot/domain/use_cases/spot_use_cases.dart';
import 'package:dristi/src/features/spot/presentation/riverpod/spot_data/spot_state.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class SpotNotifier extends Notifier<SpotState> {
  late SpotUseCase useCase;

  @override
  SpotState build() {
    useCase = ref.read(spotUseCaseProvider);
    return const SpotState();
  }

  Future<void> getSpotData(String appLanguage, String spotId) async {
    try {
      state = state.copyWith(
        status: SpotStatus.loading,
      );

      final response = await useCase.getSpotData(appLanguage, spotId);

      if (response.id.isNotEmpty) {
        state = state.copyWith(
          data: response,
          status: SpotStatus.success,
        );
      } else {
        state = state.copyWith(
          status: SpotStatus.failure,
        );
      }
    } catch (e, stackTrace) {
      Log.error(e.toString());
      Log.error(stackTrace.toString());

      state = state.copyWith(
        status: SpotStatus.failure,
      );
    }
  }
}
