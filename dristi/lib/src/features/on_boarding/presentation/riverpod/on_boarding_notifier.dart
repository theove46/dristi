import 'package:dristi/src/core/loggers/logger.dart';
import 'package:dristi/src/features/on_boarding/domain/use_cases/on_boarding_use_case.dart';
import 'package:dristi/src/features/on_boarding/presentation/riverpod/on_boarding_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OnBoardingNotifier extends Notifier<OnBoardingState> {
  late OnBoardingUseCase useCase;

  @override
  OnBoardingState build() {
    useCase = ref.read(onBoardingUseCaseProvider);
    return const OnBoardingState();
  }

  Future<bool> getFirstTimeStatus() async {
    try {
      final response = await useCase.getFirstTimeStatus();

      return response;
    } catch (e, stackTrace) {
      Log.error(e.toString());
      Log.error(stackTrace.toString());

      return true;
    }
  }

  Future<void> getOnBoardingComponents() async {
    try {
      final response = await useCase.getOnBoardingComponents();

      if (response.isNotEmpty) {
        state = state.copyWith(
          data: response,
        );
      } else {
        state = state.copyWith(
          status: OnBoardingStatus.failure,
        );
      }
    } catch (e, stackTrace) {
      Log.error(e.toString());
      Log.error(stackTrace.toString());

      state = state.copyWith(
        status: OnBoardingStatus.failure,
      );
    }
  }

  Future<void> homeScreenNavigationSubmit() async {
    try {
      state = state.copyWith(status: OnBoardingStatus.loading);

      final response = await useCase.buttonSubmit();
      await useCase.setFirstTimeStatusFalse();

      if (response.$1.isEmpty) {
        state = state.copyWith(
          status: OnBoardingStatus.success,
        );
      } else {
        state = state.copyWith(
          status: OnBoardingStatus.failure,
        );
      }
    } catch (e, stackTrace) {
      Log.debug(stackTrace.toString());
      state = state.copyWith(
        status: OnBoardingStatus.failure,
      );
    }
  }
}
