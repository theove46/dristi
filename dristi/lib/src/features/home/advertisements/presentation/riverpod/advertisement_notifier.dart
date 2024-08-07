import 'package:dristi/src/core/loggers/logger.dart';
import 'package:dristi/src/features/home/advertisements/domain/use_cases/advertisement_use_cases.dart';
import 'package:dristi/src/features/home/advertisements/presentation/riverpod/advertisement_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AdvertisementNotifier extends Notifier<AdvertisementState> {
  late AdvertisementUseCase useCase;

  @override
  AdvertisementState build() {
    useCase = ref.read(advertisementUseCaseProvider);
    return const AdvertisementState();
  }

  Future<void> getSingleAdvertisementComponents() async {
    try {
      state = state.copyWith(
        status: AdvertisementStatus.loading,
      );

      final response = await useCase.getSingleAdvertisementComponents();

      if (response.image.isNotEmpty) {
        state = state.copyWith(
          data: response,
          status: AdvertisementStatus.success,
        );
      } else {
        state = state.copyWith(
          status: AdvertisementStatus.failure,
        );
      }
    } catch (e, stackTrace) {
      Log.error(e.toString());
      Log.error(stackTrace.toString());

      state = state.copyWith(
        status: AdvertisementStatus.failure,
      );
    }
  }

  Future<void> getMultipleAdvertisementComponents() async {
    try {
      state = state.copyWith(
        status: AdvertisementStatus.loading,
      );

      final response = await useCase.getMultipleAdvertisementComponents();

      if (response.isNotEmpty) {
        state = state.copyWith(
          data: response,
          status: AdvertisementStatus.success,
        );
      } else {
        state = state.copyWith(
          status: AdvertisementStatus.failure,
        );
      }
    } catch (e, stackTrace) {
      Log.error(e.toString());
      Log.error(stackTrace.toString());

      state = state.copyWith(
        status: AdvertisementStatus.failure,
      );
    }
  }
}
