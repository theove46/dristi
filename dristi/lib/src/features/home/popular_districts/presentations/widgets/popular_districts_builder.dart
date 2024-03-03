import 'package:dristi/src/core/constants/app_values.dart';
import 'package:dristi/src/core/services/routes/routes.dart';
import 'package:dristi/src/core/constants/text_constants.dart';
import 'package:dristi/src/core/theme/text_styles.dart';
import 'package:dristi/src/features/home/home_page/riverpod/home_provider.dart';
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
      padding: EdgeInsets.only(top: AppValues.dimen_16.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            TextConstants.popularDistricts,
            style: primaryNovaBold16,
          ),
          TextButton(
            onPressed: navigateToDistrictPage,
            child: Text(
              TextConstants.explore,
              style: primaryNovaBold12,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDestinations() {
    final popularDistricts = ref.watch(popularDistrictProvider);

    return SizedBox(
      height: AppValues.dimen_150.h,
      child: popularDistricts.data != null
          ? ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: popularDistricts.data.length,
              itemBuilder: (context, index) {
                final item = popularDistricts.data[index];
                return Padding(
                  padding: EdgeInsets.only(right: AppValues.dimen_8.w),
                  child: GestureDetector(
                    onTap: navigateToDestinationsPage,
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius:
                              BorderRadius.circular(AppValues.dimen_16.r),
                          child: Image.network(
                            item.image,
                            width: AppValues.dimen_130.r,
                            height: AppValues.dimen_130.r,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(height: AppValues.dimen_4.h),
                        Text(
                          item.titleEn,
                          style: blackNovaBold12,
                        ),
                      ],
                    ),
                  ),
                );
              },
            )
          : Container(),
    );
  }

  void navigateToDistrictPage() {
    Navigator.pushNamed(
      context,
      Routes.districts,
    );
  }

  void navigateToDestinationsPage() {
    Navigator.pushNamed(
      context,
      Routes.destination,
    );
  }
}
