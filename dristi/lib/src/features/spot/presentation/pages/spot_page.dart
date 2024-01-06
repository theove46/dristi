import 'package:dristi/src/core/assets/assets.dart';
import 'package:dristi/src/core/theme/colors.dart';
import 'package:dristi/src/core/theme/font_style.dart';
import 'package:dristi/src/core/utils/texts/text_constants.dart';
import 'package:dristi/src/features/spot/presentation/riverpod/spot_provider.dart';
import 'package:dristi/src/features/spot/presentation/widgets/description_items_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SpotPage extends ConsumerStatefulWidget {
  const SpotPage({super.key});

  @override
  ConsumerState createState() => _SpotPageState();
}

class _SpotPageState extends ConsumerState<SpotPage> {
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
            child: Padding(
              padding: EdgeInsets.all(0.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildImage(),
                  _buildDescription(),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: 20.sp,
              horizontal: 10.sp,
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
      borderRadius: const BorderRadius.vertical(
        bottom: Radius.circular(20),
      ),
      child: Image.asset(
        Assets.nilgiri,
        height: 500.h,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildGalleryIcon() {
    return Positioned(
      bottom: 100.sp,
      right: 16.sp,
      child: GestureDetector(
        onTap: () {},
        child: Container(
          padding: EdgeInsets.all(3.sp),
          height: 75.sp,
          width: 75.sp,
          decoration: BoxDecoration(
            color: UIColors.white,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10.r),
                child: SizedBox.fromSize(
                  size: Size.fromRadius(48.r), // Image radius
                  child: Image.asset(
                    Assets.bandarban,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Center(
                child: Icon(
                  Icons.more_horiz_outlined,
                  color: UIColors.white,
                  size: 32.h,
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
      bottom: 16.sp,
      right: 16.sp,
      child: Transform.rotate(
        angle: -15 * (3.1415926535 / 180),
        child: Text(
          "Nil Giri",
          style: AppTypography.bold44VibesWithShadow(
            color: UIColors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildDescription() {
    return Padding(
      padding: EdgeInsets.all(16.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const DescriptionItemsBuilder(),
          Text(
            "Nil Giri",
            style: AppTypography.bold28Nova(
              color: UIColors.primary,
            ),
          ),
          SizedBox(height: 10.sp),
          Row(
            children: [
              const Icon(
                Icons.location_on_outlined,
                color: UIColors.primary,
              ),
              Text(
                ' Bandarban, Chattogram',
                style: AppTypography.bold18Nova(
                  color: UIColors.primary,
                ),
              ),
            ],
          ),
          SizedBox(height: 10.sp),
          Text(
            TextConstants.boiler,
            textAlign: TextAlign.justify,
            style: AppTypography.regular14Nova(
              color: UIColors.black,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBackButton() {
    return IconButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      icon: Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: UIColors.white,
        ),
        padding: EdgeInsets.only(left: 6.sp),
        child: Center(
          child: Icon(
            Icons.arrow_back_ios,
            color: UIColors.black,
            size: 20.h,
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
            size: 20.h,
          ),
        ),
      ),
    );
  }
}
