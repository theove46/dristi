import 'package:dristi/src/core/loggers/logger.dart';
import 'package:dristi/src/features/home/top_destinations/domain/use_cases/top_destinations_use_case.dart';
import 'package:dristi/src/features/home/top_destinations/presentations/riverpod/top_destinations_state.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class TopDestinationsNotifier extends Notifier<TopDestinationsState> {
  late TopDestinationsUseCase useCase;

  @override
  TopDestinationsState build() {
    useCase = ref.read(topDestinationsUseCaseProvider);
    return const TopDestinationsState();
  }

  Future<void> topDestinationsComponents() async {
    try {
      state = state.copyWith(
        status: TopDestinationsStatus.loading,
      );

      final response = await useCase.getTopDestinationsComponents();

      if (response.isNotEmpty) {
        state = state.copyWith(
          data: response,
          status: TopDestinationsStatus.success,
        );
      } else {
        state = state.copyWith(
          status: TopDestinationsStatus.failure,
        );
      }
    } catch (e, stackTrace) {
      Log.error(e.toString());
      Log.error(stackTrace.toString());

      state = state.copyWith(
        status: TopDestinationsStatus.failure,
      );
    }
  }
}
