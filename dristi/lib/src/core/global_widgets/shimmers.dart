import 'package:dristi/src/core/constants/app_values.dart';
import 'package:dristi/src/core/styles/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

Widget buildShimmer({
  required BuildContext context,
  required double height,
  required double width,
  Widget? child,
}) {
  final gradient = LinearGradient(
    colors: UIColors.shimmerGradient(context),
    begin: const Alignment(-1.0, -0.3),
    end: const Alignment(1.0, 0.3),
    tileMode: TileMode.clamp,
    stops: const [0.1, 0.3, 0.4],
  );

  return Shimmer(
    gradient: gradient,
    child: SizedBox(
      height: height,
      width: width,
      child: child,
    ),
  );
}

Widget buildShimmerContainer({
  required BuildContext context,
  required double height,
  required double width,
  required double borderRadius,
}) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(borderRadius),
    child: Container(
      height: height,
      width: width,
      color: UIColors.componentsWhite(context),
    ),
  );
}

Widget buildSquareHorizontalListShimmer({
  required BuildContext context,
  required double height,
  required double itemSize,
  required int itemCount,
}) {
  return buildShimmer(
    context: context,
    height: height,
    width: double.infinity,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: itemCount,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(right: AppValues.dimen_8.w),
          child: Column(
            children: [
              buildShimmerContainer(
                context: context,
                height: itemSize,
                width: itemSize,
                borderRadius: AppValues.dimen_16.r,
              ),
              SizedBox(height: AppValues.dimen_4.h),
              buildShimmerContainer(
                context: context,
                height: AppValues.dimen_10.r,
                width: itemSize,
                borderRadius: AppValues.dimen_6.r,
              ),
            ],
          ),
        );
      },
    ),
  );
}

Widget buildSliderShimmer(BuildContext context) {
  return buildShimmer(
    context: context,
    height: AppValues.dimen_220.h,
    width: double.infinity,
    child: buildShimmerContainer(
      context: context,
      height: AppValues.dimen_220.h,
      width: double.infinity,
      borderRadius: AppValues.dimen_10.r,
    ),
  );
}

Widget buildAdvertisementShimmer(BuildContext context) {
  return buildShimmer(
    context: context,
    height: AppValues.dimen_130.h,
    width: double.infinity,
    child: Padding(
      padding: EdgeInsets.only(top: AppValues.dimen_16.h),
      child: buildShimmerContainer(
        context: context,
        height: AppValues.dimen_120.h,
        width: double.infinity,
        borderRadius: AppValues.dimen_10.r,
      ),
    ),
  );
}

Widget buildSliderIndicatorShimmer(BuildContext context) {
  return buildShimmer(
    context: context,
    height: AppValues.dimen_12.h,
    width: double.infinity,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(5, (index) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: AppValues.dimen_1.w),
          child: buildShimmerContainer(
            context: context,
            height: AppValues.dimen_12.h,
            width: index == 0 ? AppValues.dimen_50.w : AppValues.dimen_28.w,
            borderRadius: AppValues.dimen_5.r,
          ),
        );
      }),
    ),
  );
}

Widget buildCategoriesShimmer(BuildContext context) {
  return Container(
    height: AppValues.dimen_240.h,
    width: AppValues.dimen_1.sw,
    margin: EdgeInsets.all(AppValues.dimen_2.r),
    padding: EdgeInsets.all(AppValues.dimen_16.r),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(
        Radius.circular(AppValues.dimen_10.r),
      ),
      border: Border.all(
        color: UIColors.componentsPrimary(context).withOpacity(0.5),
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
            gradient: LinearGradient(
              colors: UIColors.shimmerGradient(context),
              begin: const Alignment(-1.0, -0.3),
              end: const Alignment(1.0, 0.3),
              tileMode: TileMode.clamp,
              stops: const [0.1, 0.3, 0.4],
            ),
            child: SizedBox(
              width: AppValues.dimen_75.w,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: AppValues.dimen_10.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildShimmerContainer(
                      context: context,
                      width: AppValues.dimen_60.r,
                      height: AppValues.dimen_60.r,
                      borderRadius: AppValues.dimen_6.r,
                    ),
                    SizedBox(height: AppValues.dimen_4.h),
                    buildShimmerContainer(
                      context: context,
                      width: AppValues.dimen_60.r,
                      height: AppValues.dimen_10.r,
                      borderRadius: AppValues.dimen_6.r,
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

Widget buildTopDestinationsShimmer(BuildContext context) {
  return buildSquareHorizontalListShimmer(
    context: context,
    height: AppValues.dimen_100.h,
    itemSize: AppValues.dimen_80.r,
    itemCount: 6,
  );
}

Widget buildPopularDistrictsShimmer(BuildContext context) {
  return buildSquareHorizontalListShimmer(
    context: context,
    height: AppValues.dimen_150.h,
    itemSize: AppValues.dimen_130.r,
    itemCount: 6,
  );
}
