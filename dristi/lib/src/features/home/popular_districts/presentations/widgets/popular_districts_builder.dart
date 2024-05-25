import 'package:dristi/src/core/base/base_consumer_stateful_widget.dart';
import 'package:dristi/src/core/constants/app_values.dart';
import 'package:dristi/src/core/routes/app_routes.dart';
import 'package:dristi/src/core/utils/localization_ext.dart';
import 'package:dristi/src/core/widgets/shimmers.dart';
import 'package:dristi/src/features/home/home_screen/riverpod/home_provider.dart';
import 'package:dristi/src/features/home/popular_districts/presentations/riverpod/popular_districts_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PopularDistrictsBuilder extends ConsumerStatefulWidget {
  const PopularDistrictsBuilder({super.key});

  @override
  ConsumerState createState() => _PopularCitiesBuilderState();
}

class _PopularCitiesBuilderState
    extends BaseConsumerStatefulWidget<PopularDistrictsBuilder> {
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
            context.localization.popularDistricts,
            style: appTextStyles.primaryNovaBold16,
          ),
          TextButton(
            onPressed: navigateToDistrictPage,
            child: Text(
              context.localization.explore,
              style: appTextStyles.primaryNovaSemiBold12,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDestinations() {
    final popularDistricts = ref.watch(popularDistrictProvider);

    if (popularDistricts.status != PopularDistrictsStatus.success ||
        popularDistricts.data == null) {
      return buildPopularDistrictsShimmer();
    }

    return SizedBox(
      height: AppValues.dimen_150.h,
      child: ListView.builder(
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
                    borderRadius: BorderRadius.circular(AppValues.dimen_16.r),
                    child: Image.network(
                      item.image,
                      width: AppValues.dimen_130.r,
                      height: AppValues.dimen_130.r,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Text(
                    item.titleEn, // TODO fix max letter
                    style: appTextStyles.secondaryNovaRegular12,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void navigateToDistrictPage() {
    Navigator.pushNamed(
      context,
      AppRoutes.districts,
    );
  }

  void navigateToDestinationsPage() {
    Navigator.pushNamed(
      context,
      AppRoutes.destination,
    );
  }
}
