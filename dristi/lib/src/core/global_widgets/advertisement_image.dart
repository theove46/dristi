import 'package:dristi/src/core/base/base_stateful_widget.dart';
import 'package:dristi/src/core/constants/app_assets.dart';
import 'package:dristi/src/core/constants/app_values.dart';
import 'package:dristi/src/core/routes/app_routes.dart';
import 'package:dristi/src/core/utils/localization_ext.dart';
import 'package:dristi/src/features/home/advertisements/domain/entity/advertisement_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class AdvertisementImage extends StatefulWidget {
  const AdvertisementImage({
    super.key,
  });

  @override
  State<AdvertisementImage> createState() => _AdvertisementImageState();
}

class _AdvertisementImageState extends BaseStatefulWidget<AdvertisementImage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        navigateToWebView(item: MultipleAdvertisementEntity.initial());
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: AppValues.dimen_60.r,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppValues.dimen_16.r),
              color: uiColors.background,
              image: const DecorationImage(
                image: AssetImage(Assets.advertiseBanner),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: EdgeInsets.only(right: AppValues.dimen_20.w),
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: AppValues.dimen_8.r,
                  vertical: AppValues.dimen_8.r,
                ),
                decoration: BoxDecoration(
                  color: uiColors.shadow.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(
                    AppValues.dimen_10.r,
                  ),
                ),
                child: Text(
                  context.localization.visitNow,
                  style: appTextStyles.onImageNovaRegular12,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void navigateToWebView({required MultipleAdvertisementEntity item}) {
    context.pushNamed(AppRoutes.webView, extra: item);
  }
}
