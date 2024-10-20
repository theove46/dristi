import 'package:dristi/src/core/base/base_consumer_stateful_widget.dart';
import 'package:dristi/src/core/constants/app_assets.dart';
import 'package:dristi/src/core/utils/localization_ext.dart';
import 'package:dristi/src/features/settings/presentation/riverpod/settings_provider.dart';
import 'package:dristi/src/features/settings/presentation/widgets/settings_bottom_sheet.dart';
import 'package:dristi/src/features/settings/presentation/widgets/settings_item.dart';
import 'package:dristi/src/features/settings/presentation/widgets/social_accounts_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RatingsAndReview extends ConsumerStatefulWidget {
  const RatingsAndReview({super.key});

  @override
  ConsumerState createState() => _RatingsAndReviewState();
}

class _RatingsAndReviewState
    extends BaseConsumerStatefulWidget<RatingsAndReview> {
  @override
  Widget build(BuildContext context) {
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
        onPressed: () {},
      );
    }

    return SettingsItems(
      icon: Assets.follow,
      title: context.localization.ratingsAndReview,
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return SettingsBottomSheet(
              title: context.localization.ratingsAndReview,
              description: ratingsReviewsState.description,
              callBackWidget: buildCallBackWidget(),
            );
          },
        );
      },
    );
  }
}
