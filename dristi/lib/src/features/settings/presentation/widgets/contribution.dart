import 'package:dristi/src/core/base/base_consumer_stateful_widget.dart';
import 'package:dristi/src/core/constants/app_assets.dart';
import 'package:dristi/src/core/global_providers/deep_linking_providers/deep_linking_provider.dart';
import 'package:dristi/src/core/global_widgets/primary_snackbar.dart';
import 'package:dristi/src/core/utils/localization_ext.dart';
import 'package:dristi/src/features/settings/presentation/riverpod/settings_provider.dart';
import 'package:dristi/src/features/settings/presentation/widgets/settings_bottom_sheet.dart';
import 'package:dristi/src/features/settings/presentation/widgets/settings_item.dart';
import 'package:dristi/src/features/settings/presentation/widgets/social_accounts_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Contribution extends ConsumerStatefulWidget {
  const Contribution({super.key});

  @override
  ConsumerState createState() => _ContributionState();
}

class _ContributionState extends BaseConsumerStatefulWidget<Contribution> {
  @override
  Widget build(BuildContext context) {
    final settingsState = ref.watch(settingsProvider);

    final deepLinkingNotifier = ref.read(deepLinkingProvider.notifier);

    if (settingsState.data == null || settingsState.data.follow == null) {
      return const SizedBox.shrink();
    }

    final contributionState = settingsState.data!.contribution!;

    final contributionOpeningError =
        context.localization.contributionOpeningError;

    Widget buildCallBackWidget() {
      return SocialAccountsTile(
        title: context.localization.googleForm,
        url: contributionState.googleForm,
        icon: Assets.googleForm,
        onPressed: () async {
          try {
            await deepLinkingNotifier.openSocialAccountsOrLinks(
              url: settingsState.data.contribution.googleForm,
            );
          } catch (error) {
            errorSnackBar(contributionOpeningError);
          }
        },
      );
    }

    return SettingsItems(
      icon: Assets.contribution,
      title: context.localization.contribution,
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return SettingsBottomSheet(
              title: context.localization.contribution,
              description: contributionState.description,
              callBackWidget: buildCallBackWidget(),
            );
          },
        );
      },
    );
  }

  void errorSnackBar(String message) async {
    ShowSnackBarMessage.showErrorSnackBar(
      message: message,
      context: context,
    );
  }
}
