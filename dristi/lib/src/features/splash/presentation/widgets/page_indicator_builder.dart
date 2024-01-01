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
        bottom: 120.sp,
        left: 0.sp,
        right: 0.sp,
        child: Align(
          alignment: Alignment.center,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  splashModelsState.data.length,
                  (index) => Padding(
                    padding: EdgeInsets.symmetric(horizontal: 1.sp),
                    child: Container(
                      height: 8.sp,
                      width: currentSplashState == index ? 40.sp : 20.sp,
                      decoration: BoxDecoration(
                        color: currentSplashState == index
                            ? UIColors.primary
                            : UIColors.white,
                        borderRadius: BorderRadius.circular(3.r),
                        border: Border.all(
                          color: UIColors.primary,
                        ),
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
