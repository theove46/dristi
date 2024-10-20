import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dristi/src/core/constants/app_assets.dart';
import 'package:dristi/src/core/constants/app_global_texts.dart';
import 'package:dristi/src/core/global_providers/network_status/network_status_provider.dart';
import 'package:dristi/src/core/routes/app_routes.dart';
import 'package:dristi/src/core/base/base_consumer_stateful_widget.dart';
import 'package:dristi/src/core/constants/app_values.dart';
import 'package:dristi/src/core/global_providers/language_settings/language_settings_provider.dart';
import 'package:dristi/src/core/utils/localization_ext.dart';
import 'package:dristi/src/features/settings/presentation/riverpod/settings_provider.dart';
import 'package:dristi/src/features/settings/presentation/widgets/contact.dart';
import 'package:dristi/src/features/settings/presentation/widgets/contribution.dart';
import 'package:dristi/src/features/settings/presentation/widgets/follow_social_accounts.dart';
import 'package:dristi/src/features/settings/presentation/widgets/language_settings.dart';
import 'package:dristi/src/features/settings/presentation/widgets/ratings_and_review.dart';
import 'package:dristi/src/features/settings/presentation/widgets/settings_bottom_sheet.dart';
import 'package:dristi/src/features/settings/presentation/widgets/settings_item.dart';
import 'package:dristi/src/features/settings/presentation/widgets/theme_settings.dart';
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
      const ThemeSettings(),
      const LanguageSettings(),
      const FollowSocialAccounts(),
      const RatingsAndReview(),
      SettingsItems(
        icon: Assets.share,
        title: context.localization.shareDristi,
        onTap: () {},
      ),
      const Contribution(),
      const Contact(),
      SettingsItems(
        icon: Assets.promotion,
        title: context.localization.makePromotion,
        onTap: () {
          navigateToPromotionScreen();
        },
      ),
      SettingsItems(
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

  Widget _buildPrivacyPolicy() {
    final settingsState = ref.watch(settingsProvider);

    return SettingsItems(
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

    return SettingsItems(
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
    return SettingsItems(
      icon: Assets.version,
      title: context.localization.appVersion,
      subTitle: TextConstants.appVersion,
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

  void navigateToPromotionScreen() {
    context.pushNamed(AppRoutes.promotion);
  }
}
