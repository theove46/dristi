import 'package:dristi/src/core/base/base_consumer_stateful_widget.dart';
import 'package:dristi/src/core/constants/app_assets.dart';
import 'package:dristi/src/core/constants/app_values.dart';
import 'package:dristi/src/core/styles/colors.dart';
import 'package:dristi/src/core/utils/asset_image_view.dart';
import 'package:dristi/src/core/utils/localization_ext.dart';
import 'package:dristi/src/features/home/home_screen/riverpod/home_provider.dart';
import 'package:dristi/src/features/home/categories/presentations/widgets/categories_builder.dart';
import 'package:dristi/src/features/home/sliders/presentations/widgets/slider_builder.dart';
import 'package:dristi/src/features/home/popular_districts/presentations/widgets/popular_districts_builder.dart';
import 'package:dristi/src/features/home/top_destinations/presentations/widgets/top_destinations_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState createState() => _HomePageState();
}

class _HomePageState extends BaseConsumerStatefulWidget<HomeScreen> {
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
      appBar: AppBar(
        leading: IconButton(
          icon: AssetImageView(
            fileName: Assets.menu,
            fit: BoxFit.cover,
            height: AppValues.dimen_30.r,
            width: AppValues.dimen_30.r,
            color: UIColors.primary,
          ),
          onPressed: () {},
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(AppValues.dimen_16.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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

  Widget _buildTitleMessage() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.localization.exploreThe,
          style: appTextStyles.primaryNovaMedium24,
        ),
        SizedBox(height: AppValues.dimen_10.h),
        Text(
          context.localization.beautifulBD,
          style: appTextStyles.primaryNovaBold28,
        ),
        const Divider(),
      ],
    );
  }
}
