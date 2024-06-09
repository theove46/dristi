import 'package:dristi/src/core/base/base_stateful_widget.dart';
import 'package:dristi/src/core/constants/app_values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class TopScreenIcons extends StatefulWidget {
  const TopScreenIcons({super.key});

  @override
  State<TopScreenIcons> createState() => _TopScreenIconsState();
}

class _TopScreenIconsState extends BaseStatefulWidget<TopScreenIcons> {
  @override
  Widget build(BuildContext context) {
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
