import 'package:dristi/src/core/utils/loggers/logger.dart';
import 'package:dristi/src/features/home/popular_districts/domain/use_cases/popular_districts_use_case.dart';
import 'package:dristi/src/features/home/popular_districts/presentations/riverpod/popular_districts_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PopularDistrictNotifier extends Notifier<PopularDistrictState> {
  late PopularDistrictUseCase useCase;

  @override
  PopularDistrictState build() {
    useCase = ref.read(popularDistrictUseCaseProvider);
    return const PopularDistrictState();
  }

  Future<void> getPopularDistrictComponents() async {
    try {
      final response = await useCase.getPopularDistrictComponents();

      if (response.$1.isEmpty) {
        state = state.copyWith(
          data: response.$2,
        );
      } else {
        state = state.copyWith(
          status: PopularDistrictStatus.failure,
        );
      }
    } catch (e, stackTrace) {
      Log.error(e.toString());
      Log.error(stackTrace.toString());

      state = state.copyWith(
        status: PopularDistrictStatus.failure,
      );
    }
  }
}
