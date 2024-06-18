import 'package:dristi/l10n/localizations.dart';
import 'package:dristi/src/core/cache/cache_service.dart';
import 'package:dristi/src/core/global_providers/language_settings/language_settings_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LanguageNotifier extends Notifier<LanguageState> {
  late CacheService cacheService;

  @override
  LanguageState build() {
    cacheService = ref.read(cacheServiceProvider);
    return const LanguageState();
  }

  Future<void> loadInitialLanguageState() async {
    final language = await cacheService.getLanguage();

    state = state.copyWith(
      language: language,
    );
  }

  void setLanguage(AppLanguages language) {
    cacheService.setLanguage(language);

    state = state.copyWith(
      language: language,
    );
  }
}
