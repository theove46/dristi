import 'package:dristi/src/core/loggers/logger.dart';
import 'package:dristi/src/features/spot/domain/use_cases/spot_items_use_cases.dart';
import 'package:dristi/src/features/spot/presentation/riverpod/spot_state.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class SpotNotifier extends Notifier<SpotState> {
  late SpotItemsUseCase useCase;

  @override
  SpotState build() {
    useCase = ref.read(spotItemsUseCaseProvider);
    return const SpotState();
  }

  Future<void> getSpotItemsComponents(String appLanguage) async {
    try {
      final response = await useCase.getSpotItemsComponents(appLanguage);

      if (response.$1.isEmpty) {
        state = state.copyWith(
          data: response.$2,
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
