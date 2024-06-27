import 'package:dristi/src/core/loggers/logger.dart';
import 'package:dristi/src/features/destinations_list/domain/use_cases/destinations_list_use_case.dart';
import 'package:dristi/src/features/destinations_list/presentation/riverpod/destinations_list_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DestinationsListNotifier extends Notifier<DestinationsListState> {
  late DestinationsListUseCase useCase;

  @override
  DestinationsListState build() {
    useCase = ref.read(destinationsListUseCaseProvider);
    return const DestinationsListState();
  }

  Future<void> getDestinationsListComponents(String appLanguage) async {
    try {
      state = state.copyWith(
        status: DestinationListStatus.loading,
      );

      final response = await useCase.getDestinationsListComponents(appLanguage);

      if (response.isNotEmpty) {
        state = state.copyWith(
          data: response,
          status: DestinationListStatus.success,
        );
      } else {
        state = state.copyWith(
          status: DestinationListStatus.failure,
        );
      }
    } catch (e, stackTrace) {
      Log.error(e.toString());
      Log.error(stackTrace.toString());

      state = state.copyWith(
        status: DestinationListStatus.failure,
      );
    }
  }
}
