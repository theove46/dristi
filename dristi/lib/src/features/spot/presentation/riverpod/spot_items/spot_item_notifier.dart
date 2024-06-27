import 'package:dristi/src/core/loggers/logger.dart';
import 'package:dristi/src/features/spot/domain/use_cases/spot_use_cases.dart';
import 'package:dristi/src/features/spot/presentation/riverpod/spot_items/spot_item_state.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class SpotItemsNotifier extends Notifier<SpotItemsState> {
  late SpotUseCase useCase;

  @override
  SpotItemsState build() {
    useCase = ref.read(spotUseCaseProvider);
    return const SpotItemsState();
  }

  Future<void> getSpotItems(String appLanguage) async {
    try {
      final response = await useCase.getSpotItems(appLanguage);

      if (response.$1.isEmpty) {
        state = state.copyWith(
          data: response.$2,
        );
      } else {
        state = state.copyWith(
          status: SpotItemsStatus.failure,
        );
      }
    } catch (e, stackTrace) {
      Log.error(e.toString());
      Log.error(stackTrace.toString());

      state = state.copyWith(
        status: SpotItemsStatus.failure,
      );
    }
  }
}
