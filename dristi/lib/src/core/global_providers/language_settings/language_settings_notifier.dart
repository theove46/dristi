import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dristi/l10n/localizations.dart';
import 'package:dristi/src/core/cache/cache_service.dart';
import 'package:dristi/src/core/global_providers/language_settings/language_settings_state.dart';
import 'package:dristi/src/core/global_providers/network_status/network_status_provider.dart';
import 'package:dristi/src/core/utils/localization_ext.dart';
import 'package:dristi/src/features/districts/presentation/riverpod/district_provider.dart';
import 'package:dristi/src/features/home/home_screen/riverpod/home_provider.dart';
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

  Future<void> getHomeComponents(String appLanguage) async {
    final state = ref.watch(networkStatusProvider);
    if (state.value?.first != ConnectivityResult.none) {
      ref.read(sliderProvider.notifier).getSliderComponents();
      ref
          .read(categoriesProvider.notifier)
          .getCategoriesComponents(appLanguage);
      ref
          .read(multipleAdvertisementProvider.notifier)
          .getMultipleAdvertisementComponents();
      ref.read(topDestinationsProvider.notifier).topDestinationsComponents();
      ref
          .read(popularDistrictProvider.notifier)
          .getPopularDistrictComponents(appLanguage);
      ref.read(districtProvider.notifier).getDistrictComponents();
    }
  }

  void setLanguage(AppLanguages language) async {
    state = state.copyWith(
      language: language,
    );

    await cacheService.setLanguage(language);
    await getHomeComponents(language.toLanguage.languageCode);
  }
}
