import 'package:dristi/src/core/base/base_consumer_stateful_widget.dart';
import 'package:dristi/src/core/constants/app_assets.dart';
import 'package:dristi/src/core/constants/app_values.dart';
import 'package:dristi/src/core/utils/asset_image_view.dart';
import 'package:dristi/src/core/utils/localization_ext.dart';
import 'package:dristi/src/features/spot/presentation/riverpod/spot_provider.dart';
import 'package:dristi/src/features/spot/presentation/widgets/description_items_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

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
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _buildImage(),
          _buildDescription(),
          _buildTopNavigationIcons(),
        ],
      ),
    );
  }

  Widget _buildImage() {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        _buildBackgroundImage(),
        _buildGalleryIcon(),
        _buildDestinationText(),
      ],
    );
  }

  Widget _buildBackgroundImage() {
    return ClipRRect(
      child: AssetImageView(
        fileName: Assets.coxsBazar,
        fit: BoxFit.cover,
        height: AppValues.dimen_500.h,
        width: double.infinity,
      ),
    );
  }

  Widget _buildGalleryIcon() {
    return Positioned(
      bottom: AppValues.dimen_100.h,
      left: AppValues.dimen_16.w,
      child: GestureDetector(
        onTap: () {},
        child: Container(
          padding: EdgeInsets.all(AppValues.dimen_3.r),
          height: AppValues.dimen_75.r,
          width: AppValues.dimen_75.r,
          decoration: BoxDecoration(
            color: uiColors.onImage,
            borderRadius: BorderRadius.circular(AppValues.dimen_12.r),
          ),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(AppValues.dimen_10.r),
                child: SizedBox.fromSize(
                  size: Size.fromRadius(AppValues.dimen_48.r),
                  child: const AssetImageView(
                    fileName: Assets.coxsBazar,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Center(
                child: Icon(
                  Icons.more_horiz_outlined,
                  color: uiColors.onImage,
                  size: AppValues.dimen_32.h,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDestinationText() {
    return Positioned(
      bottom: AppValues.dimen_60.h,
      right: AppValues.dimen_16.w,
      child: Transform.rotate(
        angle: -15 * (3.1415926535 / 180),
        child: Text(
          "Saint Martins Island",
          style: appTextStyles.onImageBoldShadow44,
        ),
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
                    textAlign: TextAlign.justify,
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

  Widget _buildTopNavigationIcons() {
    return Positioned(
      top: AppValues.dimen_40.r,
      left: AppValues.dimen_10.r,
      right: AppValues.dimen_10.r,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildNavigationIcon(
            icon: Padding(
              padding: EdgeInsets.only(left: AppValues.dimen_6.w),
              child: Icon(
                Icons.arrow_back_ios,
                color: uiColors.primary,
                size: AppValues.dimen_20.h,
              ),
            ),
            onTap: () {
              context.pop();
            },
          ),
          _buildNavigationIcon(
            icon: Icon(
              Icons.favorite_border_outlined,
              color: uiColors.error,
              size: AppValues.dimen_20.h,
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildNavigationIcon(
      {required Widget icon, required Function()? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: AppValues.dimen_40.r,
        width: AppValues.dimen_40.r,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: uiColors.onImage,
        ),
        child: Center(child: icon),
      ),
    );
  }
}
