import 'package:dristi/src/core/constants/app_assets.dart';
import 'package:dristi/src/core/constants/app_values.dart';
import 'package:dristi/src/core/theme/colors.dart';
import 'package:dristi/src/core/theme/text_styles.dart';
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
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildImage(),
                _buildDescription(),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: AppValues.dimen_30.h,
              horizontal: AppValues.dimen_10.w,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildBackButton(),
                _buildFavouriteButton(),
              ],
            ),
          ),
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
      borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(AppValues.dimen_20.r),
      ),
      child: AssetImageView(
        fileName: Assets.coxsBazar,
        fit: BoxFit.cover,
        height: AppValues.dimen_500.r,
        width: double.infinity,
      ),
    );
  }

  Widget _buildGalleryIcon() {
    return Positioned(
      bottom: AppValues.dimen_100.h,
      right: AppValues.dimen_16.w,
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
      bottom: AppValues.dimen_16.h,
      right: AppValues.dimen_16.w,
      child: Transform.rotate(
        angle: -15 * (3.1415926535 / 180),
        child: Text(
          "Cox's Bazar",
          style: whiteVibesBoldShadow44,
        ),
      ),
    );
  }

  Widget _buildDescription() {
    return Padding(
      padding: EdgeInsets.all(AppValues.dimen_16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const DescriptionItemsBuilder(),
          Text(
            "Nil Giri",
            style: primaryNovaBold28,
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
                style: primaryNovaBold18,
              ),
            ],
          ),
          SizedBox(height: AppValues.dimen_10.h),
          Text(
            context.localization.boiler,
            textAlign: TextAlign.justify,
            style: blackNovaRegular14,
          ),
        ],
      ),
    );
  }

  Widget _buildBackButton() {
    return IconButton(
      onPressed: () {
        context.pop();
      },
      icon: Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: UIColors.white,
        ),
        padding: EdgeInsets.only(left: AppValues.dimen_6.w),
        child: Center(
          child: Icon(
            Icons.arrow_back_ios,
            color: UIColors.black,
            size: AppValues.dimen_20.h,
          ),
        ),
      ),
    );
  }

  Widget _buildFavouriteButton() {
    return IconButton(
      onPressed: () {},
      icon: Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: UIColors.white,
        ),
        child: Center(
          child: Icon(
            Icons.favorite_border_outlined,
            color: UIColors.red,
            size: AppValues.dimen_20.h,
          ),
        ),
      ),
    );
  }
}
