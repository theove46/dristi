import 'package:dristi/src/core/constants/app_values.dart';
import 'package:dristi/src/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

const gradient = LinearGradient(
  colors: [
    UIColors.secondary,
    UIColors.azure,
    UIColors.secondary,
  ],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  tileMode: TileMode.clamp,
  stops: [0.3, 0.5, 0.7],
);

Widget buildSliderShimmer() {
  return Shimmer(
    gradient: gradient,
    child: SizedBox(
      width: double.infinity,
      height: AppValues.dimen_220.h,
      child: ClipRRect(
        borderRadius: BorderRadius.all(
          Radius.circular(AppValues.dimen_10.r),
        ),
        child: Container(
          color: UIColors.white,
        ),
      ),
    ),
  );
}
