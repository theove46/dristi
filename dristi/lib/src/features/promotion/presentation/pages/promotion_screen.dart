import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dristi/src/core/base/base_consumer_stateful_widget.dart';
import 'package:dristi/src/core/constants/app_assets.dart';
import 'package:dristi/src/core/constants/app_values.dart';
import 'package:dristi/src/core/global_providers/deep_linking_providers/deep_linking_provider.dart';
import 'package:dristi/src/core/global_providers/language_settings/language_settings_provider.dart';
import 'package:dristi/src/core/global_providers/network_status/network_status_provider.dart';
import 'package:dristi/src/core/global_widgets/asset_image_view.dart';
import 'package:dristi/src/core/global_widgets/primary_snackbar.dart';
import 'package:dristi/src/core/utils/localization_ext.dart';
import 'package:dristi/src/features/settings/presentation/riverpod/settings_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class PromotionScreen extends ConsumerStatefulWidget {
  const PromotionScreen({
    super.key,
  });

  @override
  ConsumerState createState() => _PromotionScreenState();
}

class _PromotionScreenState
    extends BaseConsumerStatefulWidget<PromotionScreen> {
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
      body: Stack(
        children: [
          ClipRRect(
            child: AssetImageView(
              fileName: Assets.promotionScreenImage,
              fit: BoxFit.fill,
              height: AppValues.dimen_320.h,
              width: double.infinity,
            ),
          ),
          _buildDescription(),
          Positioned(
            top: AppValues.dimen_40.r,
            left: AppValues.dimen_10.r,
            child: _buildBackNavigationIcon(),
          ),
        ],
      ),
    );
  }

  Widget _buildBackNavigationIcon() {
    return GestureDetector(
      onTap: () => context.pop(),
      child: Container(
        height: AppValues.dimen_40.r,
        width: AppValues.dimen_40.r,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: uiColors.light,
        ),
        child: AssetImageView(
          fileName: Assets.backward,
          height: AppValues.dimen_20.r,
          width: AppValues.dimen_20.r,
          color: uiColors.primary,
        ),
      ),
    );
  }

  Widget _buildDescription() {
    return DraggableScrollableSheet(
      initialChildSize: 0.6,
      minChildSize: 0.6,
      maxChildSize: 0.9,
      builder: (context, scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: uiColors.secondary,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(AppValues.dimen_20.r),
              topRight: Radius.circular(AppValues.dimen_20.r),
            ),
          ),
          child: SingleChildScrollView(
            controller: scrollController,
            child: Padding(
              padding: EdgeInsets.all(AppValues.dimen_16.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildPromotionDescriptionText(),
                  _buildContactInformation(),
                  _buildSocialMediaFollowButtons(),
                  _buildContributionButton(),
                  _buildThankYouImage(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildPromotionDescriptionText() {
    return Center(
      child: Text(
        context.localization.promotionDescription,
        style: appTextStyles.primaryNovaBold20,
        textAlign: TextAlign.justify,
      ),
    );
  }

  Widget _buildContactInformation() {
    final settingsState = ref.watch(settingsProvider);

    final deepLinkingNotifier = ref.read(deepLinkingProvider.notifier);

    final whatsAppErrorMessage = context.localization.whatsAppLoadingError;

    if (settingsState.data == null || settingsState.data.follow == null) {
      return const SizedBox.shrink();
    }

    return Column(
      children: [
        SizedBox(height: AppValues.dimen_30.h),
        Text(
          context.localization.contactUs,
          style: appTextStyles.primaryNovaBold20,
          textAlign: TextAlign.center,
        ),
        _buildContactButton(
          asset: Assets.email,
          title: settingsState.data.contact.email,
          onPressed: () {},
        ),
        SizedBox(height: AppValues.dimen_20.h),
        _buildContactButton(
          asset: Assets.whatsapp,
          title: settingsState.data.contact.whatsapp,
          onPressed: () async {
            try {
              await deepLinkingNotifier.navigateToWhatsappMessage(
                phoneNumber: settingsState.data.contact.whatsapp,
              );
            } catch (error) {
              errorSnackBar(whatsAppErrorMessage);
            }
          },
        ),
        SizedBox(height: AppValues.dimen_30.h),
      ],
    );
  }

  Widget _buildSocialMediaFollowButtons() {
    return Column(
      children: [
        Text(
          context.localization.followDristi,
          style: appTextStyles.primaryNovaBold20,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: AppValues.dimen_10.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildSocialMediaButton(
              asset: Assets.youtube,
              onPressed: () {},
            ),
            SizedBox(width: AppValues.dimen_16.w),
            _buildSocialMediaButton(
              asset: Assets.facebook,
              onPressed: () {},
            ),
            SizedBox(width: AppValues.dimen_16.w),
            _buildSocialMediaButton(
              asset: Assets.instagram,
              onPressed: () {},
            ),
          ],
        ),
        SizedBox(height: AppValues.dimen_30.h),
      ],
    );
  }

  Widget _buildContributionButton() {
    return Column(
      children: [
        Text(
          context.localization.contributionMessage,
          style: appTextStyles.primaryNovaBold20,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: AppValues.dimen_10.h),
        GestureDetector(
          onTap: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                context.localization.googleForm,
                style: appTextStyles.primaryNovaRegular16,
              ),
              SizedBox(width: AppValues.dimen_10.w),
              _buildSocialMediaButton(
                asset: Assets.googleForm,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildContactButton({
    required String asset,
    required String title,
    required VoidCallback onPressed,
  }) {
    return GestureDetector(
      onTap: onPressed,
      child: Row(
        children: [
          AssetImageView(
            fileName: asset,
            height: AppValues.dimen_40.r,
            width: AppValues.dimen_40.r,
          ),
          SizedBox(width: AppValues.dimen_20.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: appTextStyles.primaryNovaRegular16),
              Text(context.localization.clickHereToContinue,
                  style: appTextStyles.primaryNovaRegular12),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSocialMediaButton(
      {required String asset, required VoidCallback onPressed}) {
    return GestureDetector(
      onTap: onPressed,
      child: AssetImageView(
        fileName: asset,
        height: AppValues.dimen_40.r,
        width: AppValues.dimen_40.r,
      ),
    );
  }

  Widget _buildThankYouImage() {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(AppValues.dimen_30.r),
        child: AssetImageView(
          fileName: Assets.thankYou,
          height: AppValues.dimen_150.r,
          width: AppValues.dimen_150.r,
        ),
      ),
    );
  }

  void errorSnackBar(String message) async {
    ShowSnackBarMessage.showErrorSnackBar(
      message: message,
      context: context,
    );
  }
}
