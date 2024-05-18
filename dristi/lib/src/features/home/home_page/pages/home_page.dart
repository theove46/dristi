import 'package:dristi/src/core/assets/assets.dart';
import 'package:dristi/src/core/constants/app_values.dart';
import 'package:dristi/src/core/theme/colors.dart';
import 'package:dristi/src/core/theme/text_styles.dart';
import 'package:dristi/src/core/utils/asset_image_view.dart';
import 'package:dristi/src/core/utils/localization_ext.dart';
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
          padding: EdgeInsets.all(AppValues.dimen_16.r),
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
      padding: EdgeInsets.only(
        top: AppValues.dimen_24.h,
        bottom: AppValues.dimen_2.h,
      ),
      child: AssetImageView(
        fileName: Assets.menu,
        fit: BoxFit.cover,
        height: AppValues.dimen_30.r,
        width: AppValues.dimen_30.r,
        color: UIColors.primary,
      ),
    );
  }

  Widget _buildTitleMessage() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: AppValues.dimen_10.h),
        Text(
          context.localization.exploreThe,
          style: primaryNovaMedium24,
        ),
        SizedBox(height: AppValues.dimen_10.h),
        Text(
          context.localization.beautifulBD,
          style: primaryNovaBold28,
        ),
        Divider(
          color: UIColors.primary,
          thickness: AppValues.dimen_1.h,
          height: AppValues.dimen_16.h,
        ),
      ],
    );
  }
}
