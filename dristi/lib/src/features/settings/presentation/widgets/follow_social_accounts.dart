import 'package:dristi/src/core/base/base_consumer_stateful_widget.dart';
import 'package:dristi/src/core/constants/app_assets.dart';
import 'package:dristi/src/core/utils/localization_ext.dart';
import 'package:dristi/src/features/settings/presentation/riverpod/settings_provider.dart';
import 'package:dristi/src/features/settings/presentation/widgets/settings_bottom_sheet.dart';
import 'package:dristi/src/features/settings/presentation/widgets/settings_item.dart';
import 'package:dristi/src/features/settings/presentation/widgets/social_accounts_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FollowSocialAccounts extends ConsumerStatefulWidget {
  const FollowSocialAccounts({super.key});

  @override
  ConsumerState createState() => _FollowSocialAccountsState();
}

class _FollowSocialAccountsState
    extends BaseConsumerStatefulWidget<FollowSocialAccounts> {
  @override
  Widget build(BuildContext context) {
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
            onPressed: () {},
          ),
          SocialAccountsTile(
            title: context.localization.instagram,
            url: followAccountsState.instagramUrl,
            icon: Assets.instagram,
            onPressed: () {},
          ),
        ],
      );
    }

    return SettingsItems(
      icon: Assets.follow,
      title: context.localization.followDristi,
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return SettingsBottomSheet(
              title: context.localization.followDristi,
              description: followAccountsState.description,
              callBackWidget: buildCallBackWidget(),
            );
          },
        );
      },
    );
  }
}
