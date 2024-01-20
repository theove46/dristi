import 'package:dristi/src/core/utils/loggers/logger.dart';
import 'package:dristi/src/features/home/domain/use_cases/top_destination_use_case.dart';
import 'package:dristi/src/features/home/presentation/riverpod/top_destinations/top_destinations_state.dart';

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
      final response = await useCase.topDestinationsComponents();

      if (response.$1.isEmpty) {
        state = state.copyWith(
          data: response.$2,
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
