import 'package:dristi/l10n/localizations.dart';
import 'package:dristi/src/core/cache/cache_service.dart';
import 'package:dristi/src/core/global_providers/theme_settings/theme_settings_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ThemeNotifier extends Notifier<ThemeState> {
  late CacheService cacheService;

  @override
  ThemeState build() {
    cacheService = ref.read(cacheServiceProvider);
    return const ThemeState();
  }

  Future<void> loadInitialThemeState() async {
    final theme = await cacheService.getTheme();

    state = state.copyWith(
      theme: theme,
    );
  }

  void setTheme(AppTheme theme) {
    cacheService.setTheme(theme);

    state = state.copyWith(
      theme: theme,
    );
  }
}
