import 'dart:io';

import 'package:dristi/src/core/global_providers/deep_linking_providers/deep_linking_state.dart';
import 'package:dristi/src/core/loggers/logger.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

class DeepLinkingNotifier extends Notifier<DeepLinkingState> {
  @override
  DeepLinkingState build() {
    return const DeepLinkingState();
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

      state = state.copyWith(
        status: DeepLinkingStatus.success,
      );
    } catch (e, stackTrace) {
      Log.error(e.toString());
      Log.error(stackTrace.toString());

      state = state.copyWith(
        status: DeepLinkingStatus.failure,
      );
      throw Exception(
          "Whatsapp is not installed or Error on loading Whatsapp.");
    }
  }
}
