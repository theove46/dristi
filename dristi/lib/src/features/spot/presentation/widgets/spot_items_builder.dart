import 'package:dristi/l10n/localizations.dart';
import 'package:dristi/src/core/base/base_consumer_stateful_widget.dart';
import 'package:dristi/src/core/constants/app_values.dart';
import 'package:dristi/src/core/utils/asset_image_view.dart';
import 'package:dristi/src/features/spot/domain/entities/spot_entities.dart';
import 'package:dristi/src/features/spot/presentation/riverpod/spot_data/spot_provider.dart';
import 'package:dristi/src/features/spot/presentation/riverpod/spot_items/spot_item_provider.dart';
import 'package:dristi/src/features/spot/presentation/widgets/spot_details_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DescriptionItemsBuilder extends ConsumerStatefulWidget {
  const DescriptionItemsBuilder({
    required this.destination,
    super.key,
  });

  final SpotEntity destination;

  @override
  ConsumerState createState() => _DescriptionItemsBuilderState();
}

class _DescriptionItemsBuilderState
    extends BaseConsumerStatefulWidget<DescriptionItemsBuilder> {
  @override
  Widget build(BuildContext context) {
    final spotItemsModelsState = ref.watch(spotItemsProvider);
    final currentPageNotifier = ref.read(currentPageProvider.notifier);
    final currentPageState = ref.watch(currentPageProvider);

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
                              : uiColors.shadow,
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
        return SpotScreenDetailsBuilder(destination: widget.destination);
      default:
        return _buildPageBuilderImage(image);
    }
  }

  Widget _buildPageBuilderImage(String image) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(6.r),
      child: AssetImageView(
        fileName: image,
        fit: BoxFit.contain,
        height: AppValues.dimen_100.r,
        width: AppValues.dimen_100.r,
      ),
    );
  }
}
