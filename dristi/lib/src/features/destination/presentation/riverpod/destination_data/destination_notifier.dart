import 'package:dristi/src/core/loggers/logger.dart';
import 'package:dristi/src/features/destination/domain/use_cases/destination_use_cases.dart';
import 'package:dristi/src/features/destination/presentation/riverpod/destination_data/destination_state.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class DestinationNotifier extends Notifier<DestinationState> {
  late DestinationUseCase useCase;

  @override
  DestinationState build() {
    useCase = ref.read(destinationUseCaseProvider);
    return const DestinationState();
  }

  Future<void> getDestinationData(String appLanguage, String spotId) async {
    try {
      state = state.copyWith(
        status: DestinationStatus.loading,
      );

      final response = await useCase.getDestinationData(appLanguage, spotId);

      if (response.id.isNotEmpty) {
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
