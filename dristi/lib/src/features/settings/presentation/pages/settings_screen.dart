import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dristi/src/core/constants/app_assets.dart';
import 'package:dristi/src/core/constants/app_global_texts.dart';
import 'package:dristi/src/core/global_providers/network_status/network_status_provider.dart';
import 'package:dristi/src/core/global_widgets/asset_image_view.dart';
import 'package:dristi/src/core/utils/enums.dart';
import 'package:dristi/src/core/base/base_consumer_stateful_widget.dart';
import 'package:dristi/src/core/constants/app_values.dart';
import 'package:dristi/src/core/global_providers/language_settings/language_settings_provider.dart';
import 'package:dristi/src/core/global_providers/theme_settings/theme_settings_provider.dart';
import 'package:dristi/src/core/utils/localization_ext.dart';
import 'package:dristi/src/features/home/advertisements/domain/entity/advertisement_entity.dart';
import 'package:dristi/src/features/settings/presentation/riverpod/settings_provider.dart';
import 'package:dristi/src/features/settings/presentation/widgets/settings_bottom_sheet.dart';
import 'package:dristi/src/features/settings/presentation/widgets/sheet_items.dart';
import 'package:dristi/src/features/settings/presentation/widgets/social_accounts_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsScreen extends ConsumerStatefulWidget {
  const SettingsScreen({
    super.key,
  });

  @override
  ConsumerState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends BaseConsumerStatefulWidget<SettingsScreen> {
  @override
  void initState() {
    super.initState();
    Future(() {
      _getSettingsItems();
    });
  }

  Future<void> _getSettingsItems() async {
    final appLanguageState =
        ref.watch(languageProvider).language.toLanguage.languageCode;
    final networkState = ref.watch(networkStatusProvider);

    if (networkState.value?.first != ConnectivityResult.none) {
      ref
          .read(settingsProvider.notifier)
          .getSettingsComponents(appLanguageState);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _buildSettingsAppBar(),
          SliverPadding(
            padding: EdgeInsets.only(
              left: AppValues.dimen_16.r,
              right: AppValues.dimen_16.r,
              bottom: AppValues.dimen_32.r,
            ),
            sliver: _buildSettingsItemsList(),
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsAppBar() {
    return SliverAppBar(
      floating: true,
      flexibleSpace: FlexibleSpaceBar(
        background: AppBar(
          title: Text(
            context.localization.settings,
          ),
          centerTitle: true,
        ),
      ),
      expandedHeight: AppValues.dimen_70.h,
    );
  }

  Widget _buildSettingsItemsList() {
    final settingsItems = [
      _buildThemeSettings(),
      _buildLanguageSettings(),
      _buildFollowSocialAccounts(),
      _buildRatingsReviews(),
      _buildSettingsItem(
        icon: Assets.share,
        title: context.localization.shareDristi,
        onTap: () {},
      ),
      _buildContribution(),
      _buildContactUs(),
      _buildSettingsItem(
        icon: Assets.promotion,
        title: context.localization.makePromotion,
        onTap: () {
          navigateToPromotionScreen(
            item: AdvertisementEntity.initial(),
          );
        },
      ),
      _buildSettingsItem(
        icon: Assets.support,
        title: context.localization.support,
        onTap: () {},
      ),
      _buildPrivacyPolicy(),
      _buildTermsOfService(),
      _buildAppVersion(),
    ];

    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => settingsItems[index],
        childCount: settingsItems.length,
      ),
    );
  }

  Widget _buildThemeSettings() {
    final themeState = ref.watch(themeProvider);

    return _buildSettingsItem(
      icon: Assets.theme,
      title: context.localization.theme,
      subTitle: _getThemeText(themeState.theme),
      onTap: () {
        _showSelectionBottomSheet(
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
    );
  }

  Widget _buildLanguageSettings() {
    final languageState = ref.watch(languageProvider);

    return _buildSettingsItem(
      icon: Assets.language,
      title: context.localization.language,
      subTitle: _getLanguageText(languageState.language),
      onTap: () {
        _showSelectionBottomSheet(
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
          },
        );
      },
    );
  }

  Widget _buildFollowSocialAccounts() {
    final settingsState = ref.watch(settingsProvider);

    if (settingsState.data == null || settingsState.data.follow == null) {
      return const SizedBox.shrink();
    }

    final followAccountsState = settingsState.data!.follow!;

    Widget buildCallBackWidget() {
      return Column(
        children: [
          SocialAccountsTile(
            title: context.localization.facebook,
            url: followAccountsState.facebookUrl,
            icon: Assets.facebook,
          ),
          SocialAccountsTile(
            title: context.localization.instagram,
            url: followAccountsState.instagramUrl,
            icon: Assets.instagram,
          ),
        ],
      );
    }

    return _buildSettingsItem(
      icon: Assets.follow,
      title: context.localization.followDristi,
      onTap: () {
        _showWidgetsInBottomSheet(
          title: context.localization.followDristi,
          description: followAccountsState.description,
          callBackWidget: buildCallBackWidget(),
        );
      },
    );
  }

  Widget _buildRatingsReviews() {
    final settingsState = ref.watch(settingsProvider);

    if (settingsState.data == null ||
        settingsState.data.ratingsReviews == null) {
      return const SizedBox.shrink();
    }

    final ratingsReviewsState = settingsState.data!.ratingsReviews!;

    Widget buildCallBackWidget() {
      return SocialAccountsTile(
        title: context.localization.playStore,
        url: ratingsReviewsState.playStoreLink,
        icon: Assets.playStore,
      );
    }

    return _buildSettingsItem(
      icon: Assets.follow,
      title: context.localization.ratingsAndReview,
      onTap: () {
        _showWidgetsInBottomSheet(
          title: context.localization.ratingsAndReview,
          description: ratingsReviewsState.description,
          callBackWidget: buildCallBackWidget(),
        );
      },
    );
  }

  Widget _buildContribution() {
    final settingsState = ref.watch(settingsProvider);

    if (settingsState.data == null || settingsState.data.contribution == null) {
      return const SizedBox.shrink();
    }

    final contributionState = settingsState.data!.contribution!;

    Widget buildCallBackWidget() {
      return SocialAccountsTile(
        title: context.localization.googleForm,
        url: contributionState.googleForm,
        icon: Assets.googleForm,
      );
    }

    return _buildSettingsItem(
      icon: Assets.contribution,
      title: context.localization.contribution,
      onTap: () {
        _showWidgetsInBottomSheet(
          title: context.localization.contribution,
          description: contributionState.description,
          callBackWidget: buildCallBackWidget(),
        );
      },
    );
  }

  Widget _buildContactUs() {
    final settingsState = ref.watch(settingsProvider);

    if (settingsState.data == null || settingsState.data.contact == null) {
      return const SizedBox.shrink();
    }

    final contactState = settingsState.data!.contact!;

    Widget buildCallBackWidget() {
      return Column(
        children: [
          SocialAccountsTile(
            title: context.localization.email,
            url: contactState.email,
            icon: Assets.email,
          ),
          SocialAccountsTile(
            title: context.localization.whatsapp,
            url: contactState.whatsapp,
            icon: Assets.whatsapp,
          ),
        ],
      );
    }

    return _buildSettingsItem(
      icon: Assets.contact,
      title: context.localization.contactUs,
      onTap: () {
        _showWidgetsInBottomSheet(
          title: context.localization.contactUs,
          description: contactState.description,
          callBackWidget: buildCallBackWidget(),
        );
      },
    );
  }

  Widget _buildPrivacyPolicy() {
    final settingsState = ref.watch(settingsProvider);

    return _buildSettingsItem(
      icon: Assets.ratings,
      title: context.localization.privacyPolicy,
      onTap: () {
        _showDetailsBottomSheet(
          title: context.localization.privacyPolicy,
          description: settingsState.data.privacyPolicy.description,
          listItems: settingsState.data.privacyPolicy.policies,
        );
      },
    );
  }

  Widget _buildTermsOfService() {
    final settingsState = ref.watch(settingsProvider);

    return _buildSettingsItem(
      icon: Assets.terms,
      title: context.localization.termsOfService,
      onTap: () {
        _showDetailsBottomSheet(
          title: context.localization.termsOfService,
          description: settingsState.data.termsServices.description,
          listItems: settingsState.data.termsServices.terms,
        );
      },
    );
  }

  Widget _buildAppVersion() {
    return _buildSettingsItem(
      icon: Assets.version,
      title: context.localization.appVersion,
      subTitle: TextConstants.appVersion,
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

  Widget _buildSettingsItem({
    required String icon,
    required String title,
    String? subTitle,
    VoidCallback? onTap,
  }) {
    return Card(
      color: uiColors.scrim,
      elevation: 0,
      margin: EdgeInsets.symmetric(vertical: AppValues.dimen_3.h),
      child: ListTile(
        leading: AssetImageView(
          fileName: icon,
          height: AppValues.dimen_28.r,
          width: AppValues.dimen_28.r,
          color: uiColors.primary,
        ),
        title: Text(title),
        titleTextStyle: appTextStyles.secondaryNovaRegular16,
        subtitle: subTitle != null ? Text(subTitle) : null,
        subtitleTextStyle: appTextStyles.secondaryNovaRegular12,
        onTap: onTap,
        minTileHeight: AppValues.dimen_60.h,
        contentPadding: EdgeInsets.symmetric(
          horizontal: AppValues.dimen_16.r,
          vertical: AppValues.dimen_8.r,
        ),
      ),
    );
  }

  void _showSelectionBottomSheet<T>({
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

  void _showDetailsBottomSheet<T>({
    required String title,
    required String description,
    required List<String> listItems,
  }) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SettingsBottomSheet(
          title: title,
          description: description,
          listItems: listItems,
        );
      },
    );
  }

  void _showWidgetsInBottomSheet<T>({
    required String title,
    required String description,
    required Widget callBackWidget,
  }) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SettingsBottomSheet(
          title: title,
          description: description,
          callBackWidget: callBackWidget,
        );
      },
    );
  }

  void navigateToPromotionScreen({required AdvertisementEntity item}) {
    //context.pushNamed(AppRoutes.webView, extra: item);
  }
}
