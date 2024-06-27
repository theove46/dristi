import 'package:dristi/src/core/loggers/logger.dart';
import 'package:dristi/src/features/hotels_list/domain/use_cases/hotels_list_use_case.dart';
import 'package:dristi/src/features/hotels_list/presentation/riverpod/hotels_list_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HotelsListNotifier extends Notifier<HotelsListState> {
  late HotelsListUseCase useCase;

  @override
  HotelsListState build() {
    useCase = ref.read(hotelsListUseCaseProvider);
    return const HotelsListState();
  }

  Future<void> getHotelsListComponents(String appLanguage) async {
    try {
      state = state.copyWith(
        status: HotelsListStatus.loading,
      );

      final response = await useCase.getHotelsListComponents(appLanguage);

      if (response.isNotEmpty) {
        state = state.copyWith(
          data: response,
          status: HotelsListStatus.success,
        );
      } else {
        state = state.copyWith(
          status: HotelsListStatus.failure,
        );
      }
    } catch (e, stackTrace) {
      Log.error(e.toString());
      Log.error(stackTrace.toString());

      state = state.copyWith(
        status: HotelsListStatus.failure,
      );
    }
  }
}
