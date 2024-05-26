import 'package:dristi/src/core/loggers/logger.dart';
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
      state = state.copyWith(
        status: PopularDistrictsStatus.loading,
      );

      final response = await useCase.getPopularDistrictComponents();

      if (response.isNotEmpty) {
        state = state.copyWith(
            data: response, status: PopularDistrictsStatus.success);
      } else {
        state = state.copyWith(
          status: PopularDistrictsStatus.failure,
        );
      }
    } catch (e, stackTrace) {
      Log.error(e.toString());
      Log.error(stackTrace.toString());

      state = state.copyWith(
        status: PopularDistrictsStatus.failure,
      );
    }
  }
}
