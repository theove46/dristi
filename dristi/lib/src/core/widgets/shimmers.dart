import 'package:dristi/src/core/constants/app_values.dart';
import 'package:dristi/src/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

const gradient = LinearGradient(
  colors: [
    UIColors.ghostWhite,
    UIColors.smokeWhite,
    UIColors.ghostWhite,
  ],
  begin: Alignment(-1.0, -0.3),
  end: Alignment(1.0, 0.3),
  tileMode: TileMode.clamp,
  stops: [0.1, 0.3, 0.4],
);

Widget buildSliderShimmer() {
  return Shimmer(
    gradient: gradient,
    child: SizedBox(
      height: AppValues.dimen_220.h,
      width: double.infinity,
      child: ClipRRect(
        borderRadius: BorderRadius.all(
          Radius.circular(AppValues.dimen_10.r),
        ),
        child: Container(
          height: AppValues.dimen_220.h,
          color: UIColors.white,
        ),
      ),
    ),
  );
}

Widget buildSliderIndicatorShimmer() {
  return Shimmer(
    gradient: gradient,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        5,
        (index) => Padding(
          padding: EdgeInsets.symmetric(horizontal: AppValues.dimen_1.w),
          child: Container(
            height: AppValues.dimen_12.h,
            width: index == 0 ? AppValues.dimen_40.w : AppValues.dimen_28.w,
            decoration: BoxDecoration(
              color: UIColors.white,
              borderRadius: BorderRadius.circular(AppValues.dimen_5.r),
              border: Border.all(
                color: UIColors.white,
              ),
            ),
          ),
        ),
      ),
    ),
  );
}

Widget buildCategoriesShimmer() {
  return Container(
    height: AppValues.dimen_240.h,
    width: AppValues.dimen_1.sw,
    margin: EdgeInsets.all(AppValues.dimen_2.r),
    padding: EdgeInsets.all(AppValues.dimen_16.r),
    decoration: BoxDecoration(
      color: UIColors.white,
      borderRadius: BorderRadius.all(
        Radius.circular(AppValues.dimen_10.r),
      ),
      border: Border.all(
        color: UIColors.primary.withOpacity(0.5),
        width: 2.r,
      ),
    ),
    child: Align(
      alignment: Alignment.topCenter,
      child: Wrap(
        runSpacing: 10.r,
        spacing: 10.r,
        children: List.generate(
          8,
          (index) => Shimmer(
            gradient: gradient,
            child: SizedBox(
              width: AppValues.dimen_75.w,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: AppValues.dimen_10.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(AppValues.dimen_6.r),
                      child: Container(
                        width: AppValues.dimen_60.r,
                        height: AppValues.dimen_60.r,
                        color: UIColors.white,
                      ),
                    ),
                    SizedBox(height: AppValues.dimen_4.h),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(AppValues.dimen_6.r),
                      child: Container(
                        height: AppValues.dimen_10.r,
                        width: AppValues.dimen_60.r,
                        color: UIColors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}

Widget buildTopDestinationsShimmer() {
  return Shimmer(
    gradient: gradient,
    child: SizedBox(
      height: AppValues.dimen_100.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 6,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(right: AppValues.dimen_8.w),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(AppValues.dimen_16.r),
                  child: Container(
                    height: AppValues.dimen_80.r,
                    width: AppValues.dimen_80.r,
                    color: UIColors.white,
                  ),
                ),
                SizedBox(height: AppValues.dimen_4.h),
                ClipRRect(
                  borderRadius: BorderRadius.circular(AppValues.dimen_6.r),
                  child: Container(
                    height: AppValues.dimen_10.r,
                    width: AppValues.dimen_80.r,
                    color: UIColors.white,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    ),
  );
}
