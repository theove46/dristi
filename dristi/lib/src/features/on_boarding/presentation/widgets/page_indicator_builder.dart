import 'package:dristi/src/core/base/base_consumer_stateful_widget.dart';
import 'package:dristi/src/core/constants/app_values.dart';
import 'package:dristi/src/features/on_boarding/presentation/riverpod/on_boarding_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PageIndicatorBuilder extends ConsumerStatefulWidget {
  const PageIndicatorBuilder({super.key});

  @override
  ConsumerState createState() => _PageIndicatorBuilderState();
}

class _PageIndicatorBuilderState
    extends BaseConsumerStatefulWidget<PageIndicatorBuilder> {
  @override
  Widget build(BuildContext context) {
    final onBoardingModelsState = ref.watch(onBoardingProvider);
    final currentOnBoardingScreenState =
        ref.watch(currentOnBoardingScreenProvider);

    if (onBoardingModelsState.data != null) {
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
                  onBoardingModelsState.data.length,
                  (index) => Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: AppValues.dimen_2.w),
                    child: Container(
                      height: AppValues.dimen_10.h,
                      width: currentOnBoardingScreenState == index
                          ? AppValues.dimen_60.w
                          : AppValues.dimen_30.w,
                      decoration: BoxDecoration(
                        color: currentOnBoardingScreenState == index
                            ? uiColors.primary
                            : uiColors.onImage,
                        borderRadius:
                            BorderRadius.circular(AppValues.dimen_2.r),
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
      return const SizedBox.shrink();
    }
  }
}
