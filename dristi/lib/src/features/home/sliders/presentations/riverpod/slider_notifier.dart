import 'package:dristi/src/core/loggers/logger.dart';
import 'package:dristi/src/features/home/sliders/domain/use_cases/slider_use_cases.dart';
import 'package:dristi/src/features/home/sliders/presentations/riverpod/slider_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SliderNotifier extends Notifier<SliderState> {
  late SliderUseCase useCase;

  @override
  SliderState build() {
    useCase = ref.read(sliderUseCaseProvider);
    return const SliderState();
  }

  Future<void> getSliderComponents() async {
    state = state.copyWith(status: SliderStatus.loading);

    try {
      final response = await useCase.getSliderComponents();

      if (response.isNotEmpty) {
        state = state.copyWith(
          data: response,
        );
      } else {
        state = state.copyWith(
          status: SliderStatus.failure,
        );
      }
    } catch (e, stackTrace) {
      Log.error(e.toString());
      Log.error(stackTrace.toString());

      state = state.copyWith(
        status: SliderStatus.failure,
      );
    }
  }
}
