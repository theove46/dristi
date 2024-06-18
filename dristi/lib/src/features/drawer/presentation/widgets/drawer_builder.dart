import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dristi/l10n/localizations.dart';
import 'package:dristi/src/core/base/base_consumer_stateful_widget.dart';
import 'package:dristi/src/core/global_providers/language_settings/language_settings_provider.dart';
import 'package:dristi/src/core/global_providers/network_status/network_status_provider.dart';
import 'package:dristi/src/core/global_providers/theme_settings/theme_settings_provider.dart';
import 'package:dristi/src/core/routes/app_routes.dart';
import 'package:dristi/src/core/utils/localization_ext.dart';
import 'package:dristi/src/features/districts/presentation/riverpod/district_provider.dart';
import 'package:dristi/src/features/home/advertisements/domain/entity/advertisement_entity.dart';
import 'package:dristi/src/features/home/home_screen/riverpod/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:dristi/src/core/constants/app_assets.dart';
import 'package:dristi/src/core/constants/app_values.dart';
import 'package:dristi/src/core/utils/asset_image_view.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class DrawerBuilder extends ConsumerStatefulWidget {
  const DrawerBuilder({Key? key}) : super(key: key);

  @override
  ConsumerState createState() => _DrawerBuilderState();
}

class _DrawerBuilderState extends BaseConsumerStatefulWidget<DrawerBuilder> {
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

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppValues.dimen_280.w,
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.all(AppValues.dimen_8.r),
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: AppValues.dimen_60.r,
                bottom: AppValues.dimen_10.r,
                left: AppValues.dimen_16.r,
              ),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    padding: EdgeInsets.all(AppValues.dimen_2.r),
                    decoration: BoxDecoration(
                      color: uiColors.onImage,
                      shape: BoxShape.circle,
                    ),
                    child: ClipOval(
                      child: SizedBox.fromSize(
                        size: Size.fromRadius(AppValues.dimen_40.r),
                        child: const AssetImageView(
                          fileName: Assets.logo,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  )),
            ),
            _buildExpansionTile(
              title: context.localization.theme,
              children: [
                _buildThemeButton(
                  text: context.localization.systemDefault,
                  value: AppTheme.systemDefault,
                ),
                _buildThemeButton(
                  text: context.localization.light,
                  value: AppTheme.light,
                ),
                _buildThemeButton(
                  text: context.localization.dark,
                  value: AppTheme.dark,
                ),
              ],
            ),
            _buildExpansionTile(
              title: context.localization.language,
              children: [
                _buildLanguageButton(
                  text: context.localization.english,
                  value: AppLanguages.en,
                ),
                _buildLanguageButton(
                  text: context.localization.bengali,
                  value: AppLanguages.bn,
                ),
              ],
            ),
            ListTile(
              title: Text(
                context.localization.favouritePlaces,
                style: appTextStyles.secondaryNovaRegular16,
              ),
              trailing: Padding(
                padding: EdgeInsets.only(right: AppValues.dimen_2.w),
                child: Icon(
                  Icons.favorite_sharp,
                  color: uiColors.primary,
                  size: AppValues.dimen_20.sp,
                ),
              ),
              onTap: () {},
            ),
            ListTile(
              title: Text(
                context.localization.settings,
                style: appTextStyles.secondaryNovaRegular16,
              ),
              trailing: Padding(
                padding: EdgeInsets.only(right: AppValues.dimen_2.w),
                child: Icon(
                  Icons.settings_sharp,
                  color: uiColors.primary,
                  size: AppValues.dimen_20.sp,
                ),
              ),
              onTap: () {},
            ),
            ListTile(
              title: Text(
                context.localization.contactUs,
                style: appTextStyles.secondaryNovaRegular16,
              ),
              trailing: Padding(
                padding: EdgeInsets.only(right: AppValues.dimen_2.w),
                child: Icon(
                  Icons.contact_mail_outlined,
                  color: uiColors.primary,
                  size: AppValues.dimen_20.sp,
                ),
              ),
              onTap: () {
                navigateToWebView(
                  item: AdvertisementEntity.initial(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExpansionTile({
    required String title,
    required List<Widget> children,
  }) {
    return ExpansionTile(
      title: Text(
        title,
        style: appTextStyles.secondaryNovaRegular16,
      ),
      shape: const Border(),
      collapsedIconColor: uiColors.primary,
      children: children,
    );
  }

  Widget _buildThemeButton({
    required String text,
    required AppTheme value,
  }) {
    final selectedTheme = ref.watch(themeProvider);
    final themeNotifier = ref.read(themeProvider.notifier);

    return ListTile(
      title: Text(
        text,
        style: appTextStyles.secondaryNovaRegular12,
      ),
      trailing: Radio<AppTheme>(
        value: value,
        groupValue: selectedTheme.theme,
        onChanged: (val) {
          themeNotifier.setTheme(val!);
        },
        activeColor: uiColors.primary,
        fillColor: WidgetStateColor.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return uiColors.primary;
          }
          return uiColors.primary;
        }),
      ),
    );
  }

  Widget _buildLanguageButton({
    required String text,
    required AppLanguages value,
  }) {
    final selectedLanguage = ref.watch(languageProvider);
    final languageNotifier = ref.read(languageProvider.notifier);

    return ListTile(
      title: Text(
        text,
        style: appTextStyles.secondaryNovaRegular12,
      ),
      trailing: Radio<AppLanguages>(
        value: value,
        groupValue: selectedLanguage.language,
        onChanged: (val) {
          languageNotifier.setLanguage(val!);
          Future(() {
            getHomeComponents();
          });
        },
        activeColor: uiColors.primary,
        fillColor: WidgetStateColor.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return uiColors.primary;
          }
          return uiColors.primary;
        }),
      ),
    );
  }

  void navigateToWebView({required AdvertisementEntity item}) {
    context.pushNamed(AppRoutes.webView, extra: item);
  }
}
