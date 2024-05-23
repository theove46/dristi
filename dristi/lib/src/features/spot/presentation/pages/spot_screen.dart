import 'package:dristi/src/core/constants/app_assets.dart';
import 'package:dristi/src/core/constants/app_values.dart';
import 'package:dristi/src/core/styles/colors.dart';
import 'package:dristi/src/core/styles/texts.dart';
import 'package:dristi/src/core/utils/asset_image_view.dart';
import 'package:dristi/src/core/utils/localization_ext.dart';
import 'package:dristi/src/features/spot/presentation/riverpod/spot_provider.dart';
import 'package:dristi/src/features/spot/presentation/widgets/description_items_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SpotScreen extends ConsumerStatefulWidget {
  const SpotScreen({super.key});

  @override
  ConsumerState createState() => _SpotPageState();
}

class _SpotPageState extends ConsumerState<SpotScreen> {
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
            color: UIColors.white,
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
                  color: UIColors.white,
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
          style: AppTextStyles(context).tertiaryVibesBoldShadow44,
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
              color: UIColors.white,
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
                    style: AppTextStyles(context).primaryNovaBold28,
                  ),
                  SizedBox(height: AppValues.dimen_10.h),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on_outlined,
                        color: UIColors.primary,
                      ),
                      Text(
                        ' Bandarban, Chattogram',
                        style: AppTextStyles(context).primaryNovaBold18,
                      ),
                    ],
                  ),
                  SizedBox(height: AppValues.dimen_10.h),
                  Text(
                    context.localization.boiler,
                    textAlign: TextAlign.justify,
                    style: AppTextStyles(context).secondaryNovaRegular14,
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
                color: UIColors.primary,
                size: AppValues.dimen_20.h,
              ),
            ),
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
          _buildNavigationIcon(
            icon: Icon(
              Icons.favorite_border_outlined,
              color: UIColors.error,
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
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: UIColors.azure,
        ),
        child: Center(child: icon),
      ),
    );
  }
}
