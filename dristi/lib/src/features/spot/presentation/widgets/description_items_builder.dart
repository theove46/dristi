import 'package:dristi/src/core/theme/colors.dart';
import 'package:dristi/src/core/theme/font_style.dart';
import 'package:dristi/src/features/spot/data/model/description_items_model.dart';
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
  final List<DescriptionItemsModel> items =
      DescriptionItemsModel.fetchAllData();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return Padding(
            padding: EdgeInsets.only(right: 16.sp),
            child: SizedBox(
              width: 50.w,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
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
              ),
            ),
          );
        },
      ),
    );
  }
}
