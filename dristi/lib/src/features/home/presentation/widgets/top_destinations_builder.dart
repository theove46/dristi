import 'package:dristi/src/core/services/routes/routes.dart';
import 'package:dristi/src/core/theme/colors.dart';
import 'package:dristi/src/core/theme/font_style.dart';
import 'package:dristi/src/core/utils/texts/text_constants.dart';
import 'package:dristi/src/features/home/presentation/riverpod/home_provider.dart';
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
      padding: EdgeInsets.only(top: 16.sp),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            TextConstants.topDestinations,
            style: AppTypography.bold16Nova(
              color: UIColors.primary,
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              TextConstants.viewAll,
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
    final topDestinationItems = ref.watch(topDestinationsProvider);

    return SizedBox(
      height: 100.sp,
      child: topDestinationItems.data != null
          ? ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: topDestinationItems.data.length,
              itemBuilder: (context, index) {
                final item = topDestinationItems.data[index];
                return Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: GestureDetector(
                    onTap: navigateToSpotPage,
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(16.r),
                          child: Image.asset(
                            item.image,
                            width: 80.sp,
                            height: 80.sp,
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
                  ),
                );
              },
            )
          : Container(),
    );
  }

  void navigateToSpotPage() {
    Navigator.pushNamed(
      context,
      Routes.spot,
    );
  }
}
