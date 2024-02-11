import 'package:dristi/src/core/utils/loggers/logger.dart';
import 'package:dristi/src/features/destinations/domain/use_cases/destination_use_case.dart';
import 'package:dristi/src/features/destinations/presentation/riverpod/destination_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DestinationNotifier extends Notifier<DestinationState> {
  late DestinationUseCase useCase;

  @override
  DestinationState build() {
    useCase = ref.read(destinationUseCaseProvider);
    return const DestinationState();
  }

  Future<void> getDestinationComponents() async {
    try {
      final response = await useCase.getDestinationComponents();

      if (response.$1.isEmpty) {
        state = state.copyWith(
          data: response.$2,
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
