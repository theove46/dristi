import 'package:dristi/src/core/constants/app_values.dart';
import 'package:dristi/src/core/styles/texts.dart';
import 'package:dristi/src/core/utils/asset_image_view.dart';
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
            height: AppValues.dimen_100.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: spotItemsModelsState.data.length,
              itemBuilder: (context, index) {
                final item = spotItemsModelsState.data[index];
                return SizedBox(
                  width: AppValues.dimen_75.w,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(6.r),
                        child: AssetImageView(
                          fileName: item.image,
                          fit: BoxFit.cover,
                          height: AppValues.dimen_40.r,
                          width: AppValues.dimen_40.r,
                        ),
                      ),
                      SizedBox(height: AppValues.dimen_4.h),
                      Text(
                        item.title,
                        style: AppTextStyles(context).secondaryNovaRegular12,
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
