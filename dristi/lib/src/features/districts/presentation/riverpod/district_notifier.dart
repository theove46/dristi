import 'package:dristi/src/core/loggers/logger.dart';
import 'package:dristi/src/features/districts/domain/use_cases/district_use_case.dart';
import 'package:dristi/src/features/districts/presentation/riverpod/district_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DistrictNotifier extends Notifier<DistrictState> {
  late DistrictUseCase useCase;

  @override
  DistrictState build() {
    useCase = ref.read(districtUseCaseProvider);
    return const DistrictState();
  }

  Future<void> getDistrictComponents(String appLanguage) async {
    try {
      final response = await useCase.getDistrictComponents(appLanguage);

      if (response.$1.isEmpty) {
        state = state.copyWith(
          data: response.$2,
        );
      } else {
        state = state.copyWith(
          status: DistrictStatus.failure,
        );
      }
    } catch (e, stackTrace) {
      Log.error(e.toString());
      Log.error(stackTrace.toString());

      state = state.copyWith(
        status: DistrictStatus.failure,
      );
    }
  }
}
