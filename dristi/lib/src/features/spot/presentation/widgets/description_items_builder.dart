import 'package:dristi/src/core/theme/colors.dart';
import 'package:dristi/src/core/theme/font_style.dart';
import 'package:dristi/src/features/spot/presentation/riverpod/spot_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DescriptionItemsBuilder extends ConsumerStatefulWidget {
  const DescriptionItemsBuilder({super.key});

  @override
  ConsumerState createState() => _DescriptionItemsBuilderState();
}

class _DescriptionItemsBuilderState
    extends ConsumerState<DescriptionItemsBuilder> {
  @override
  Widget build(BuildContext context) {
    final spotItemsModelsState = ref.watch(spotProvider);

    return spotItemsModelsState.data != null
        ? SizedBox(
            height: 100.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: spotItemsModelsState.data.length,
              itemBuilder: (context, index) {
                final item = spotItemsModelsState.data[index];
                return SizedBox(
                  width: 75.w,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(6.r),
                        child: Image.asset(
                          item.image,
                          width: 40.sp,
                          height: 40.sp,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(height: 4.sp),
                      Text(
                        item.title,
                        style: AppTypography.regular12Nova(
                          color: UIColors.black,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          )
        : Container();
  }
}
