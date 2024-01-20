import 'package:dristi/src/core/utils/loggers/logger.dart';
import 'package:dristi/src/features/splash/domain/use_cases/splash_use_case.dart';
import 'package:dristi/src/features/splash/presentation/riverpod/splash_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SplashNotifier extends Notifier<SplashState> {
  late SplashUseCase useCase;

  @override
  SplashState build() {
    useCase = ref.read(splashUseCaseProvider);
    return const SplashState();
  }

  Future<void> getSplashComponents() async {
    try {
      final response = await useCase.getSplashComponents();

      if (response.$1.isEmpty) {
        state = state.copyWith(
          data: response.$2,
        );
      } else {
        state = state.copyWith(
          status: SplashStatus.failure,
        );
      }
    } catch (e, stackTrace) {
      Log.error(e.toString());
      Log.error(stackTrace.toString());

      state = state.copyWith(
        status: SplashStatus.failure,
      );
    }
  }

  Future<void> splashPageSubmit() async {
    try {
      state = state.copyWith(status: SplashStatus.loading);

      final response = await useCase.buttonSubmit();

      if (response.$1.isEmpty) {
        state = state.copyWith(
          status: SplashStatus.success,
        );
      } else {
        state = state.copyWith(
          status: SplashStatus.failure,
        );
      }
    } catch (e, stackTrace) {
      Log.debug(stackTrace.toString());
      state = state.copyWith(
        status: SplashStatus.failure,
      );
    }
  }
}
