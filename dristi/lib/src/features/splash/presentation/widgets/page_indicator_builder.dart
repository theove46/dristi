import 'package:dristi/src/core/constants/app_values.dart';
import 'package:dristi/src/core/theme/colors.dart';
import 'package:dristi/src/features/splash/presentation/riverpod/splash_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PageIndicatorBuilder extends ConsumerStatefulWidget {
  const PageIndicatorBuilder({super.key});

  @override
  ConsumerState createState() => _PageIndicatorBuilderState();
}

class _PageIndicatorBuilderState extends ConsumerState<PageIndicatorBuilder> {
  @override
  Widget build(BuildContext context) {
    final splashModelsState = ref.watch(splashProvider);
    final currentSplashState = ref.watch(currentSplashProvider);

    if (splashModelsState.data != null) {
      return Positioned(
        bottom: AppValues.dimen_120.h,
        left: AppValues.dimen_0.w,
        right: AppValues.dimen_0.w,
        child: Align(
          alignment: Alignment.center,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  splashModelsState.data.length,
                  (index) => Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: AppValues.dimen_2.w),
                    child: Container(
                      height: AppValues.dimen_10.h,
                      width: currentSplashState == index
                          ? AppValues.dimen_40.w
                          : AppValues.dimen_28.w,
                      decoration: BoxDecoration(
                        color: currentSplashState == index
                            ? UIColors.primary
                            : UIColors.white,
                        borderRadius:
                            BorderRadius.circular(AppValues.dimen_5.r),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      return Container();
    }
  }
}
