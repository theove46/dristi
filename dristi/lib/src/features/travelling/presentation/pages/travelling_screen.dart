import 'package:dristi/src/core/base/base_consumer_stateful_widget.dart';
import 'package:dristi/src/core/constants/app_assets.dart';
import 'package:dristi/src/core/constants/app_values.dart';
import 'package:dristi/src/core/global_providers/spots_providers/spot_providers.dart';
import 'package:dristi/src/core/global_widgets/asset_image_view.dart';
import 'package:dristi/src/core/routes/app_routes.dart';
import 'package:dristi/src/core/utils/localization_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class TravellingScreen extends ConsumerStatefulWidget {
  const TravellingScreen({super.key});

  @override
  ConsumerState createState() => _TravellingScreenState();
}

class _TravellingScreenState
    extends BaseConsumerStatefulWidget<TravellingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: uiColors.dark,
      body: Stack(
        children: [
          const AssetImageView(
            fileName: Assets.kaptai,
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
          _buildGradient(),
          Positioned(
            top: AppValues.dimen_100.r,
            left: AppValues.dimen_20.r,
            child: _buildTitleMessage(),
          ),
          Positioned(
            top: AppValues.dimen_280.h,
            child: _buildItemsList(),
          ),
        ],
      ),
    );
  }

  Widget _buildTitleMessage() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.localization.findYour,
          style: appTextStyles.onImageNovaBold36,
        ),
        Text(
          context.localization.favouritePlace,
          style: appTextStyles.onImageNovaBold36,
        ),
        const Divider(),
      ],
    );
  }

  Widget _buildItemsList() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppValues.dimen_20.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildItem(
            title: context.localization.allDistrictsBD,
            icon: Assets.districts,
            onTap: () {
              context.pushNamed(AppRoutes.districts);
            },
          ),
          _buildItem(
            title: context.localization.destinations,
            icon: Assets.destinations,
            onTap: () {
              context.pushNamed(AppRoutes.destinationsList);
            },
          ),
          _buildItem(
            title: context.localization.hotelsAndResorts,
            icon: Assets.hotels,
            onTap: () {
              context.pushNamed(AppRoutes.accommodationsList);
            },
          ),
          _buildItem(
            title: context.localization.favouritePlaces,
            icon: Assets.favorites,
            onTap: () {
              ref.watch(spotsListIsShowFavourite);
              final isShowFavouriteHotelsNotifier =
                  ref.read(spotsListIsShowFavourite.notifier);

              isShowFavouriteHotelsNotifier.state = true;

              context.pushNamed(AppRoutes.destinationsList);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildItem({
    required String title,
    required String icon,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: AppValues.dimen_240.w,
        child: Card(
          color: uiColors.light.withOpacity(0.5),
          elevation: 1,
          child: Row(
            children: [
              Card(
                color: uiColors.light,
                child: SizedBox(
                  height: AppValues.dimen_40.r,
                  width: AppValues.dimen_40.r,
                  child: Padding(
                    padding: EdgeInsets.all(AppValues.dimen_4.r),
                    child: AssetImageView(
                      fileName: icon,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: AppValues.dimen_10.w),
                child: Text(
                  title,
                  style: appTextStyles.darkNovaBold12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGradient() {
    return Container(
      decoration: BoxDecoration(
        gradient: RadialGradient(
          center: Alignment.topLeft,
          tileMode: TileMode.clamp,
          radius: 1.5.r,
          colors: [
            uiColors.dark,
            uiColors.dark.withOpacity(0.8),
            uiColors.dark.withOpacity(0.5),
            uiColors.dark.withOpacity(0.2),
            uiColors.light.withOpacity(0.0),
            uiColors.light.withOpacity(0.0),
            uiColors.light.withOpacity(0.0),
          ],
        ),
      ),
    );
  }
}
