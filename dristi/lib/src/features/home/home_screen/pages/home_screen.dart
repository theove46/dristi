import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dristi/src/core/base/base_consumer_stateful_widget.dart';
import 'package:dristi/src/core/constants/app_values.dart';
import 'package:dristi/src/core/global_providers/language_settings/language_settings_provider.dart';
import 'package:dristi/src/core/global_providers/network_status/network_status_provider.dart';
import 'package:dristi/src/core/global_widgets/network_error_alert.dart';
import 'package:dristi/src/core/routes/app_routes.dart';
import 'package:dristi/src/core/utils/localization_ext.dart';
import 'package:dristi/src/features/districts/presentation/riverpod/district_provider.dart';
import 'package:dristi/src/features/drawer/presentation/widgets/drawer_builder.dart';
import 'package:dristi/src/features/home/advertisements/presentation/widgets/advertisement_builder.dart';
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
  ConsumerState createState() => _HomeScreenState();
}

class _HomeScreenState extends BaseConsumerStatefulWidget<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Future(() {
      getHomeComponents();
    });
  }

  Future<void> getHomeComponents() async {
    final appLanguageState =
        ref.watch(languageProvider).language.toLanguage.languageCode;
    final state = ref.watch(networkStatusProvider);

    if (state.value?.first != ConnectivityResult.none) {
      ref.read(sliderProvider.notifier).getSliderComponents();
      ref
          .read(categoriesProvider.notifier)
          .getCategoriesComponents(appLanguageState);
      ref
          .read(multipleAdvertisementProvider.notifier)
          .getMultipleAdvertisementComponents();
      ref
          .read(topDestinationsProvider.notifier)
          .topDestinationsComponents(appLanguageState);
      ref
          .read(popularDistrictProvider.notifier)
          .getPopularDistrictComponents(appLanguageState);
      ref.read(districtProvider.notifier).getDistrictComponents();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerBuilder(),
      body: RefreshIndicator(
        onRefresh: getHomeComponents,
        child: CustomScrollView(
          slivers: [
            _buildSliverAppBar(),
            const SliverToBoxAdapter(
              child: NetworkErrorAlert(),
            ),
            _buildSliverBody(),
          ],
        ),
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
      automaticallyImplyLeading: false,
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      // Leading Icon Image

      // leading: IconButton(
      //   icon: AssetImageView(
      //     fileName: Assets.menu,
      //     fit: BoxFit.cover,
      //     height: AppValues.dimen_30.r,
      //     width: AppValues.dimen_30.r,
      //     color: uiColors.primary,
      //   ),
      //   onPressed: () {
      //     Scaffold.of(context).openDrawer();
      //   },
      // ),

      title: GestureDetector(
        onTap: () {
          context.pushNamed(AppRoutes.destination);
        },
        child: Padding(
          padding: EdgeInsets.only(right: AppValues.dimen_16.w),
          child: Container(
            height: AppValues.dimen_50.h,
            width: double.infinity,
            decoration: BoxDecoration(
              color: uiColors.scrim,
              borderRadius: BorderRadius.all(
                Radius.circular(
                  AppValues.dimen_10.r,
                ),
              ),
              border: Border.all(
                color: uiColors.scrim,
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
                    style: appTextStyles.blushNovaRegular12,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSliverBody() {
    return SliverToBoxAdapter(
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
            const AdvertisementBuilder(),
            const TopDestinationBuilder(),
            const PopularDistrictsBuilder(),
          ],
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
          style: appTextStyles.primaryNovaBold20,
        ),
        Text(
          context.localization.beautifulBD,
          style: appTextStyles.primaryNovaBold28,
        ),
        const Divider(),
      ],
    );
  }
}
