import 'package:dristi/src/core/loggers/logger.dart';
import 'package:dristi/src/features/settings/domain/repositories/settings_repositories.dart';
import 'package:dristi/src/features/settings/presentation/riverpod/settings_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SettingsNotifier extends Notifier<SettingsState> {
  late SettingsRepository repository;

  @override
  SettingsState build() {
    repository = ref.read(settingsRepositoryProvider);
    return const SettingsState();
  }

  Future<void> getSettingsComponents(String appLanguage) async {
    try {
      state = state.copyWith(
        status: SettingsStatus.loading,
      );

      final response = await repository.getSettingsComponents(appLanguage);

      if (response.message.isNotEmpty) {
        state = state.copyWith(
          data: response,
          status: SettingsStatus.success,
        );
      } else {
        state = state.copyWith(
          status: SettingsStatus.failure,
        );
      }
    } catch (e, stackTrace) {
      Log.error(e.toString());
      Log.error(stackTrace.toString());

      state = state.copyWith(
        status: SettingsStatus.failure,
      );
    }
  }
}
