import 'package:dristi/l10n/localizations.dart';
import 'package:dristi/src/core/base/base_consumer_stateful_widget.dart';
import 'package:dristi/src/core/constants/app_values.dart';
import 'package:dristi/src/core/utils/asset_image_view.dart';
import 'package:dristi/src/features/destination/presentation/riverpod/destination_data/destination_provider.dart';
import 'package:dristi/src/features/destination/presentation/riverpod/destination_items/destination_item_provider.dart';
import 'package:dristi/src/features/destination/presentation/widgets/destination_blogs_builder.dart';
import 'package:dristi/src/features/destination/presentation/widgets/destination_cautions_builder.dart';
import 'package:dristi/src/features/destination/presentation/widgets/destination_details_builder.dart';
import 'package:dristi/src/features/destination/presentation/widgets/destination_hotels_builder.dart';
import 'package:dristi/src/features/destination/presentation/widgets/destination_nearest_builder.dart';
import 'package:dristi/src/features/destination/presentation/widgets/destination_seasons_builder.dart';
import 'package:dristi/src/features/destination/presentation/widgets/destination_specials_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DestinationScreenItemsBuilder extends ConsumerStatefulWidget {
  const DestinationScreenItemsBuilder({
    required this.instanceId,
    super.key,
  });

  final String instanceId;

  @override
  ConsumerState createState() => _DestinationScreenItemsBuilderState();
}

class _DestinationScreenItemsBuilderState
    extends BaseConsumerStatefulWidget<DestinationScreenItemsBuilder> {
  @override
  Widget build(BuildContext context) {
    final spotItemsModelsState = ref.watch(spotItemsProvider);

    final currentPageState = ref.watch(currentPageProvider(widget.instanceId));
    final currentPageNotifier =
        ref.read(currentPageProvider(widget.instanceId).notifier);

    if (spotItemsModelsState.data == null) {
      return const SizedBox.shrink();
    }

    return Column(
      children: [
        SizedBox(
          height: AppValues.dimen_100.h,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: spotItemsModelsState.data.length,
            itemBuilder: (context, index) {
              final item = spotItemsModelsState.data[index];

              return GestureDetector(
                onTap: () {
                  currentPageNotifier.state = index;
                },
                child: SizedBox(
                  width: AppValues.dimen_75.w,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(6.r),
                        child: AssetImageView(
                          fileName: item.image,
                          fit: BoxFit.cover,
                          height: AppValues.dimen_40.r,
                          width: AppValues.dimen_40.r,
                        ),
                      ),
                      SizedBox(height: AppValues.dimen_4.h),
                      Text(
                        item.title,
                        style: appTextStyles.secondaryNovaRegular12,
                      ),
                      SizedBox(height: AppValues.dimen_2.h),
                      ClipRRect(
                        borderRadius:
                            BorderRadius.circular(AppValues.dimen_4.r),
                        child: Container(
                          height: AppValues.dimen_6.h,
                          width: AppValues.dimen_70.w,
                          color: currentPageState == index
                              ? uiColors.primary
                              : uiColors.background,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        _buildPageView(
          SpotScreenType.values[currentPageState],
          spotItemsModelsState.data[currentPageState].image,
        ),
      ],
    );
  }

  Widget _buildPageView(SpotScreenType screenType, String image) {
    switch (screenType) {
      case SpotScreenType.detailsScreen:
        return const DestinationScreenDetailsBuilder();
      case SpotScreenType.hotelsScreen:
        return const DestinationScreenHotelsBuilder();
      case SpotScreenType.nearestScreen:
        return const DestinationScreenNearestBuilder();
      case SpotScreenType.seasonsScreen:
        return const DestinationScreenSeasonsBuilder();
      case SpotScreenType.specialsScreen:
        return const DestinationScreenSpecialsBuilder();
      case SpotScreenType.cautionsScreen:
        return const DestinationScreenCautionsBuilder();
      case SpotScreenType.blogsScreen:
        return const DestinationScreenBlogsBuilder();
    }
  }
}
