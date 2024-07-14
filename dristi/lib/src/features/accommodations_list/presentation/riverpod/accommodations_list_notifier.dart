import 'package:dristi/src/core/loggers/logger.dart';
import 'package:dristi/src/features/accommodations_list/domain/use_cases/accommodations_list_use_case.dart';
import 'package:dristi/src/features/accommodations_list/presentation/riverpod/accommodations_list_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AccommodationsListNotifier extends Notifier<AccommodationsListState> {
  late AccommodationsListUseCase useCase;

  @override
  AccommodationsListState build() {
    useCase = ref.read(accommodationsListUseCaseProvider);
    return const AccommodationsListState();
  }

  Future<void> getAccommodationsListComponents(String appLanguage) async {
    try {
      state = state.copyWith(
        status: AccommodationsListStatus.loading,
      );

      final response =
          await useCase.getAccommodationsListComponents(appLanguage);

      if (response.isNotEmpty) {
        state = state.copyWith(
          data: response,
          status: AccommodationsListStatus.success,
        );
      } else {
        state = state.copyWith(
          status: AccommodationsListStatus.failure,
        );
      }
    } catch (e, stackTrace) {
      Log.error(e.toString());
      Log.error(stackTrace.toString());

      state = state.copyWith(
        status: AccommodationsListStatus.failure,
      );
    }
  }
}
