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

  Future<void> getSliderComponents(String appLanguage) async {
    try {
      state = state.copyWith(
        status: SliderStatus.loading,
      );

      final response = await useCase.getSliderComponents(appLanguage);

      if (response.isNotEmpty) {
        state = state.copyWith(
          data: response,
          status: SliderStatus.success,
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
