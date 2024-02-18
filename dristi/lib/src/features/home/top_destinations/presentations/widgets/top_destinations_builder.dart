import 'package:dristi/src/core/constants/app_values.dart';
import 'package:dristi/src/core/services/routes/routes.dart';
import 'package:dristi/src/core/constants/text_constants.dart';
import 'package:dristi/src/core/theme/text_styles.dart';
import 'package:dristi/src/features/home/home_page/riverpod/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TopDestinationBuilder extends ConsumerStatefulWidget {
  const TopDestinationBuilder({super.key});

  @override
  ConsumerState createState() => _TopDestinationBuilderState();
}

class _TopDestinationBuilderState extends ConsumerState<TopDestinationBuilder> {
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
            TextConstants.topDestinations,
            style: primaryNovaBold16,
          ),
          TextButton(
            onPressed: navigateToDestinationsPage,
            child: Text(
              TextConstants.viewAll,
              style: primaryNovaBold12,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDestinations() {
    final topDestinationItems = ref.watch(topDestinationsProvider);

    return SizedBox(
      height: AppValues.dimen_100.h,
      child: topDestinationItems.data != null
          ? ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: topDestinationItems.data.length,
              itemBuilder: (context, index) {
                final item = topDestinationItems.data[index];
                return Padding(
                  padding: EdgeInsets.only(right: AppValues.dimen_8.w),
                  child: GestureDetector(
                    onTap: navigateToSpotPage,
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius:
                              BorderRadius.circular(AppValues.dimen_16.r),
                          child: Image.asset(
                            item.image,
                            width: AppValues.dimen_80.r,
                            height: AppValues.dimen_80.r,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(height: AppValues.dimen_4.h),
                        Text(
                          item.title,
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

  void navigateToDestinationsPage() {
    Navigator.pushNamed(
      context,
      Routes.destination,
    );
  }

  void navigateToSpotPage() {
    Navigator.pushNamed(
      context,
      Routes.spot,
    );
  }
}
