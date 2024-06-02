import 'package:dristi/src/core/base/base_consumer_stateful_widget.dart';
import 'package:dristi/src/core/constants/app_assets.dart';
import 'package:dristi/src/core/constants/app_values.dart';
import 'package:dristi/src/core/global_widgets/network_error_alert.dart';
import 'package:dristi/src/core/routes/app_routes.dart';
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
import 'package:go_router/go_router.dart';

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
      body: CustomScrollView(
        slivers: [
          _buildSliverAppBar(),
          const SliverToBoxAdapter(
            child: NetworkErrorAlert(),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(
                left: AppValues.dimen_16.r,
                right: AppValues.dimen_16.r,
                bottom: AppValues.dimen_16.r,
              ),
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
        ],
      ),
    );
  }

  Widget _buildSliverAppBar() {
    return SliverAppBar(
      floating: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        background: _buildAppBar(),
      ),
      expandedHeight: AppValues.dimen_70.h,
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      leading: IconButton(
        icon: AssetImageView(
          fileName: Assets.menu,
          fit: BoxFit.cover,
          height: AppValues.dimen_30.r,
          width: AppValues.dimen_30.r,
          color: uiColors.primary,
        ),
        onPressed: () {},
      ),
      title: GestureDetector(
        onTap: () {
          context.pushNamed(AppRoutes.destination);
        },
        child: Padding(
          padding: EdgeInsets.only(right: AppValues.dimen_16.w),
          child: Container(
            height: AppValues.dimen_56.h,
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(
                color: uiColors.primary,
                width: 1.0,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(AppValues.dimen_10.r),
              child: Row(
                children: [
                  const Icon(Icons.search),
                  Text(
                    context.localization.search,
                    style: appTextStyles.blushNovaRegular16,
                  ),
                ],
              ),
            ),
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
          style: appTextStyles.primaryNovaBold24,
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
