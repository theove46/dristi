import 'package:dristi/src/core/loggers/logger.dart';
import 'package:dristi/src/features/destination/domain/use_cases/destination_use_cases.dart';
import 'package:dristi/src/features/destination/presentation/riverpod/destination_items/destination_item_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DestinationItemsNotifier extends Notifier<DestinationItemsState> {
  late DestinationUseCase useCase;

  @override
  DestinationItemsState build() {
    useCase = ref.read(destinationUseCaseProvider);
    return const DestinationItemsState();
  }

  Future<void> getDestinationItems(String appLanguage) async {
    try {
      final response = await useCase.getDestinationItems(appLanguage);

      if (response.$1.isEmpty) {
        state = state.copyWith(
          data: response.$2,
        );
      } else {
        state = state.copyWith(
          status: DestinationItemsStatus.failure,
        );
      }
    } catch (e, stackTrace) {
      Log.error(e.toString());
      Log.error(stackTrace.toString());

      state = state.copyWith(
        status: DestinationItemsStatus.failure,
      );
    }
  }
}
