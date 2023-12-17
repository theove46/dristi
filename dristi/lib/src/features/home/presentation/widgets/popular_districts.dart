import 'package:dristi/src/core/theme/colors.dart';
import 'package:dristi/src/core/theme/font_style.dart';
import 'package:dristi/src/core/utils/texts/text_constants.dart';
import 'package:dristi/src/features/home/data/popular_districts_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PopularDistrictsBuilder extends ConsumerStatefulWidget {
  const PopularDistrictsBuilder({super.key});

  @override
  ConsumerState createState() => _PopularCitiesBuilderState();
}

class _PopularCitiesBuilderState
    extends ConsumerState<PopularDistrictsBuilder> {
  final List<PopularDistrictsModel> popularDistrictItems =
      PopularDistrictsModel.fetchAllData();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTopHeadings(),
        _buildDestinations(),
      ],
    );
  }

  Widget _buildTopHeadings() {
    return Padding(
      padding: EdgeInsets.only(top: 16.sp),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            TextConstants.popularDistricts,
            style: AppTypography.bold16Nova(
              color: UIColors.primary,
            ),
          ),
          TextButton(
            onPressed: () {
              // View More button action
            },
            child: Text(
              TextConstants.explore,
              style: AppTypography.bold12Nova(
                color: UIColors.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDestinations() {
    return SizedBox(
      height: 150.sp,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: popularDistrictItems.length,
        itemBuilder: (context, index) {
          final item = popularDistrictItems[index];
          return Padding(
            padding: EdgeInsets.only(right: 8.h),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16.r),
                  child: Image.asset(
                    item.image,
                    width: 130.sp,
                    height: 130.sp,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 4.sp),
                Text(
                  item.title,
                  style: AppTypography.bold12Nova(
                    color: UIColors.black,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
