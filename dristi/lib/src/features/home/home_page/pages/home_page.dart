import 'package:dristi/src/core/assets/assets.dart';
import 'package:dristi/src/core/theme/colors.dart';
import 'package:dristi/src/core/theme/font_style.dart';
import 'package:dristi/src/core/utils/texts/text_constants.dart';
import 'package:dristi/src/features/home/home_page/riverpod/home_provider.dart';
import 'package:dristi/src/features/home/categories/presentations/widgets/categories_builder.dart';
import 'package:dristi/src/features/home/sliders/presentations/widgets/slider_builder.dart';
import 'package:dristi/src/features/home/popular_districts/presentations/widgets/popular_districts_builder.dart';
import 'package:dristi/src/features/home/top_destinations/presentations/widgets/top_destinations_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  void initState() {
    super.initState();
    Future(() {
      ref.read(categoriesProvider.notifier).getCategoriesComponents();
      ref.read(popularDistrictProvider.notifier).getPopularDistrictComponents();
      ref.read(sliderProvider.notifier).getSliderComponents();
      ref.read(topDestinationsProvider.notifier).topDestinationsComponents();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UIColors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildDrawerIcon(),
              const SliderBuilder(),
              _buildTitleMessage(),
              const CategoriesBuilder(),
              const TopDestinationBuilder(),
              const PopularDistrictsBuilder(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDrawerIcon() {
    return Padding(
      padding: EdgeInsets.only(top: 16.sp, bottom: 2.sp),
      child: const Image(
        image: AssetImage(Assets.menu),
        color: UIColors.primary,
        height: 30,
      ),
    );
  }

  Widget _buildTitleMessage() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10.sp),
        Text(
          TextConstants.exploreThe,
          style: AppTypography.mediumBold24Nova(
            color: UIColors.primary,
          ),
        ),
        SizedBox(height: 10.sp),
        Text(
          TextConstants.beautifulBD,
          style: AppTypography.bold28Nova(
            color: UIColors.primary,
          ),
        ),
        Divider(
          color: UIColors.primary,
          thickness: 1.sp,
          height: 16.h,
        ),
      ],
    );
  }
}
