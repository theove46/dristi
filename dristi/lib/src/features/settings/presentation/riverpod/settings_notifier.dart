import 'dart:io';

import 'package:dristi/src/core/loggers/logger.dart';
import 'package:dristi/src/features/settings/domain/repositories/settings_repositories.dart';
import 'package:dristi/src/features/settings/presentation/riverpod/settings_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

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

  Future<void> navigateToWhatsappMessage({
    required String phoneNumber,
  }) async {
    var androidUrl = "whatsapp://send?phone=$phoneNumber";
    var iosUrl = "https://wa.me/$phoneNumber";

    try {
      if (Platform.isIOS) {
        await launchUrl(Uri.parse(iosUrl));
      } else {
        await launchUrl(Uri.parse(androidUrl));
      }
    } on Exception {
      throw Exception(
          "Whatsapp is not installed or Error on loading Whatsapp.");
    }
  }
}
