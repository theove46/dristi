import 'package:dristi/src/core/base/base_consumer_stateful_widget.dart';
import 'package:dristi/src/core/constants/app_values.dart';
import 'package:dristi/src/core/global_widgets/advertisement_image.dart';
import 'package:dristi/src/core/utils/localization_ext.dart';
import 'package:dristi/src/features/home/home_screen/riverpod/home_provider.dart';
import 'package:dristi/src/features/spot/presentation/riverpod/spot_provider.dart';
import 'package:dristi/src/features/spot/presentation/widgets/description_items_builder.dart';
import 'package:dristi/src/features/spot/presentation/widgets/top_screen_icons.dart';
import 'package:dristi/src/features/spot/presentation/widgets/spot_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SpotScreen extends ConsumerStatefulWidget {
  const SpotScreen({super.key});

  @override
  ConsumerState createState() => _SpotPageState();
}

class _SpotPageState extends BaseConsumerStatefulWidget<SpotScreen> {
  @override
  void initState() {
    super.initState();
    Future(() {
      ref.read(spotProvider.notifier).getSpotItemsComponents();
      ref
          .read(singleAdvertisementProvider.notifier)
          .getSingleAdvertisementComponents();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const SpotImage(),
          _buildDescription(),
          const TopScreenIcons(),
        ],
      ),
    );
  }

  Widget _buildDescription() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: AppValues.dimen_480.h),
          Container(
            decoration: BoxDecoration(
              color: uiColors.secondary,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(AppValues.dimen_20.r),
                topRight: Radius.circular(AppValues.dimen_20.r),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(AppValues.dimen_16.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AdvertisementImage(),
                  const DescriptionItemsBuilder(),
                  Text(
                    "Nil Giri",
                    style: appTextStyles.primaryNovaBold28,
                  ),
                  SizedBox(height: AppValues.dimen_10.h),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        color: uiColors.primary,
                      ),
                      Text(
                        ' Bandarban, Chattogram',
                        style: appTextStyles.primaryNovaBold16,
                      ),
                    ],
                  ),
                  SizedBox(height: AppValues.dimen_10.h),
                  Text(
                    context.localization.boiler,
                    style: appTextStyles.secondaryNovaRegular16,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
