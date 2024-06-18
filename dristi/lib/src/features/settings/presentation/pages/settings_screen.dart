import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dristi/l10n/localizations.dart';
import 'package:dristi/src/core/base/base_consumer_stateful_widget.dart';
import 'package:dristi/src/core/constants/app_values.dart';
import 'package:dristi/src/core/global_providers/language_settings/language_settings_provider.dart';
import 'package:dristi/src/core/global_providers/network_status/network_status_provider.dart';
import 'package:dristi/src/core/global_providers/theme_settings/theme_settings_provider.dart';
import 'package:dristi/src/core/routes/app_routes.dart';
import 'package:dristi/src/core/utils/localization_ext.dart';
import 'package:dristi/src/features/districts/presentation/riverpod/district_provider.dart';
import 'package:dristi/src/features/home/advertisements/domain/entity/advertisement_entity.dart';
import 'package:dristi/src/features/home/home_screen/riverpod/home_provider.dart';
import 'package:dristi/src/features/settings/presentation/widgets/settings_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SettingsScreen extends ConsumerStatefulWidget {
  const SettingsScreen({
    super.key,
  });

  @override
  ConsumerState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends BaseConsumerStatefulWidget<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final themeState = ref.watch(themeProvider);
    final languageState = ref.watch(languageProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(context.localization.settings),
      ),
      body: ListView(
        padding: EdgeInsets.only(
          left: AppValues.dimen_16.r,
          right: AppValues.dimen_16.r,
          bottom: AppValues.dimen_16.r,
        ),
        children: [
          _buildSettingsItem(
            icon: Icons.brightness_4,
            title: context.localization.theme,
            subTitle: _getThemeText(themeState.theme),
            onTap: () {
              _showBottomSheet(
                title: context.localization.theme,
                items: [
                  SheetItem(
                    title: context.localization.systemDefault,
                    value: AppTheme.systemDefault,
                  ),
                  SheetItem(
                    title: context.localization.light,
                    value: AppTheme.light,
                  ),
                  SheetItem(
                    title: context.localization.dark,
                    value: AppTheme.dark,
                  ),
                ],
                selectedItem: themeState.theme,
                onItemSelected: (value) {
                  ref.read(themeProvider.notifier).setTheme(value);
                },
              );
            },
          ),
          _buildSettingsItem(
            icon: Icons.language,
            title: context.localization.language,
            subTitle: _getLanguageText(languageState.language),
            onTap: () {
              _showBottomSheet(
                title: context.localization.language,
                items: [
                  SheetItem(
                    title: context.localization.english,
                    value: AppLanguages.en,
                  ),
                  SheetItem(
                    title: context.localization.bengali,
                    value: AppLanguages.bn,
                  ),
                ],
                selectedItem: languageState.language,
                onItemSelected: (value) {
                  ref.read(languageProvider.notifier).setLanguage(value);
                  getHomeComponents();
                },
              );
            },
          ),
          _buildSettingsItem(
            icon: Icons.hive,
            title: context.localization.followDristi,
            onTap: () {},
          ),
          _buildSettingsItem(
            icon: Icons.share,
            title: context.localization.shareDristi,
            onTap: () {},
          ),
          _buildSettingsItem(
            icon: Icons.mail,
            title: context.localization.contactUs,
            onTap: () {},
          ),
          _buildSettingsItem(
            icon: Icons.business_center,
            title: context.localization.makePromotion,
            onTap: () {
              navigateToWebView(
                item: AdvertisementEntity.initial(),
              );
            },
          ),
          _buildSettingsItem(
            icon: Icons.volunteer_activism,
            title: context.localization.helpAndSupport,
            onTap: () {},
          ),
          _buildSettingsItem(
            icon: Icons.privacy_tip,
            title: context.localization.privacyAndPolicy,
            onTap: () {},
          ),
          _buildSettingsItem(
            icon: Icons.info_outlined,
            title: context.localization.appVersion,
            subTitle: '1.0',
            onTap: () {},
          ),
        ],
      ),
    );
  }

  String _getThemeText(AppTheme theme) {
    switch (theme) {
      case AppTheme.systemDefault:
        return context.localization.systemDefault;
      case AppTheme.light:
        return context.localization.light;
      case AppTheme.dark:
        return context.localization.dark;
      default:
        return '';
    }
  }

  String _getLanguageText(AppLanguages language) {
    switch (language) {
      case AppLanguages.en:
        return context.localization.english;
      case AppLanguages.bn:
        return context.localization.bengali;
      default:
        return '';
    }
  }

  void _showBottomSheet<T>({
    required String title,
    required List<SheetItem<T>> items,
    required T selectedItem,
    required Function(dynamic) onItemSelected,
  }) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SettingsBottomSheet(
          title: title,
          items: items,
          selectedItem: selectedItem,
          onItemSelected: onItemSelected,
        );
      },
    );
  }

  Widget _buildSettingsItem({
    required IconData icon,
    required String title,
    String? subTitle,
    required VoidCallback onTap,
  }) {
    return Card(
      color: uiColors.scrim,
      elevation: 0,
      margin: EdgeInsets.symmetric(vertical: AppValues.dimen_3.h),
      child: ListTile(
        leading: Icon(icon, color: uiColors.primary),
        title: Text(title),
        titleTextStyle: appTextStyles.secondaryNovaRegular16,
        subtitle: subTitle != null ? Text(subTitle) : null,
        subtitleTextStyle: appTextStyles.secondaryNovaRegular12,
        onTap: onTap,
        minTileHeight: AppValues.dimen_70.h,
        contentPadding: EdgeInsets.symmetric(
          horizontal: AppValues.dimen_16.r,
          vertical: AppValues.dimen_8.r,
        ),
      ),
    );
  }

  void navigateToWebView({required AdvertisementEntity item}) {
    context.pushNamed(AppRoutes.webView, extra: item);
  }

  Future<void> getHomeComponents() async {
    final state = ref.watch(networkStatusProvider);
    if (state.value?.first != ConnectivityResult.none) {
      ref.read(sliderProvider.notifier).getSliderComponents();
      ref.read(categoriesProvider.notifier).getCategoriesComponents();
      ref
          .read(multipleAdvertisementProvider.notifier)
          .getMultipleAdvertisementComponents();
      ref.read(topDestinationsProvider.notifier).topDestinationsComponents();
      ref.read(popularDistrictProvider.notifier).getPopularDistrictComponents();
      ref.read(districtProvider.notifier).getDistrictComponents();
    }
  }
}
