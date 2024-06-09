import 'package:dristi/src/core/loggers/logger.dart';
import 'package:dristi/src/features/destinations/domain/use_cases/destination_use_case.dart';
import 'package:dristi/src/features/destinations/presentation/riverpod/destination_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DestinationNotifier extends Notifier<DestinationState> {
  late DestinationsUseCase useCase;

  @override
  DestinationState build() {
    useCase = ref.read(destinationsUseCaseProvider);
    return const DestinationState();
  }

  Future<void> getDestinationComponents() async {
    try {
      state = state.copyWith(
        status: DestinationStatus.loading,
      );

      final response = await useCase.getDestinationsComponents();

      if (response.isNotEmpty) {
        state = state.copyWith(
          data: response,
          status: DestinationStatus.success,
        );
      } else {
        state = state.copyWith(
          status: DestinationStatus.failure,
        );
      }
    } catch (e, stackTrace) {
      Log.error(e.toString());
      Log.error(stackTrace.toString());

      state = state.copyWith(
        status: DestinationStatus.failure,
      );
    }
  }
}
