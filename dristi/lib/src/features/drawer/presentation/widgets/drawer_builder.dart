import 'package:dristi/src/core/base/base_consumer_stateful_widget.dart';
import 'package:dristi/src/core/routes/app_routes.dart';
import 'package:dristi/src/core/utils/localization_ext.dart';
import 'package:dristi/src/features/destinations/presentation/riverpod/destination_provider.dart';
import 'package:flutter/material.dart';
import 'package:dristi/src/core/constants/app_assets.dart';
import 'package:dristi/src/core/constants/app_values.dart';
import 'package:dristi/src/core/utils/asset_image_view.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class DrawerBuilder extends ConsumerStatefulWidget {
  const DrawerBuilder({Key? key}) : super(key: key);

  @override
  ConsumerState createState() => _DrawerBuilderState();
}

class _DrawerBuilderState extends BaseConsumerStatefulWidget<DrawerBuilder> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppValues.dimen_280.w,
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.all(AppValues.dimen_8.r),
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: AppValues.dimen_60.r,
                bottom: AppValues.dimen_10.r,
                left: AppValues.dimen_16.r,
              ),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    padding: EdgeInsets.all(AppValues.dimen_2.r),
                    decoration: BoxDecoration(
                      color: uiColors.onImage,
                      shape: BoxShape.circle,
                    ),
                    child: ClipOval(
                      child: SizedBox.fromSize(
                        size: Size.fromRadius(AppValues.dimen_40.r),
                        child: const AssetImageView(
                          fileName: Assets.logo,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  )),
            ),
            ListTile(
              title: Text(
                context.localization.favouritePlaces,
                style: appTextStyles.secondaryNovaRegular16,
              ),
              trailing: Padding(
                padding: EdgeInsets.only(right: AppValues.dimen_2.w),
                child: Icon(
                  Icons.favorite_sharp,
                  color: uiColors.primary,
                  size: AppValues.dimen_20.sp,
                ),
              ),
              onTap: () {
                ref.watch(favouriteDestinationList);
                final isShowFavouriteHotelsNotifier =
                    ref.read(favouriteDestinationList.notifier);

                isShowFavouriteHotelsNotifier.state = true;

                context.pushNamed(AppRoutes.destination);
              },
            ),
            ListTile(
              title: Text(
                context.localization.hotels,
                style: appTextStyles.secondaryNovaRegular16,
              ),
              trailing: Padding(
                padding: EdgeInsets.only(right: AppValues.dimen_2.w),
                child: Icon(
                  Icons.apartment_rounded,
                  color: uiColors.primary,
                  size: AppValues.dimen_20.sp,
                ),
              ),
              onTap: () {
                context.pushNamed(AppRoutes.hotelsList);
              },
            ),
            ListTile(
              title: Text(
                context.localization.settings,
                style: appTextStyles.secondaryNovaRegular16,
              ),
              trailing: Padding(
                padding: EdgeInsets.only(right: AppValues.dimen_2.w),
                child: Icon(
                  Icons.settings_sharp,
                  color: uiColors.primary,
                  size: AppValues.dimen_20.sp,
                ),
              ),
              onTap: () {
                navigateToSettings();
              },
            ),
          ],
        ),
      ),
    );
  }

  void navigateToSettings() {
    context.pushNamed(AppRoutes.settings);
  }
}
