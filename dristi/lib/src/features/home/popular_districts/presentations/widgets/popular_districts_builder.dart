import 'package:cached_network_image/cached_network_image.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dristi/src/core/base/base_consumer_stateful_widget.dart';
import 'package:dristi/src/core/constants/app_values.dart';
import 'package:dristi/src/core/global_providers/network_status/network_status_provider.dart';
import 'package:dristi/src/core/routes/app_routes.dart';
import 'package:dristi/src/core/utils/localization_ext.dart';
import 'package:dristi/src/core/global_widgets/shimmers.dart';
import 'package:dristi/src/features/destinations_list/presentation/riverpod/destinations_list_provider.dart';
import 'package:dristi/src/features/home/home_screen/riverpod/home_provider.dart';
import 'package:dristi/src/features/home/popular_districts/presentations/riverpod/popular_districts_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          context.localization.popularDistricts,
          style: appTextStyles.primaryNovaBold16,
        ),
        TextButton(
          onPressed: navigateToDistrictPage,
          child: Text(
            context.localization.viewAll,
            style: appTextStyles.primaryNovaSemiBold12,
          ),
        ),
      ],
    );
  }

  Widget _buildDestinations() {
    final popularDistricts = ref.watch(popularDistrictProvider);

    if (popularDistricts.status != PopularDistrictsStatus.success ||
        popularDistricts.data == null) {
      return buildPopularDistrictsShimmer(context);
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
              onTap: () {
                navigateToDestinationsPage(item.title);
              },
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(AppValues.dimen_16.r),
                    child: CachedNetworkImage(
                      imageUrl: item.image,
                      width: AppValues.dimen_130.r,
                      height: AppValues.dimen_130.r,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    width: AppValues.dimen_120.r,
                    child: Text(
                      item.title,
                      style: appTextStyles.secondaryNovaRegular12,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                    ),
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
    context.pushNamed(AppRoutes.districts);
  }

  void navigateToDestinationsPage(String title) {
    ref.watch(destinationsListDistrictField);
    ref.read(destinationsListDistrictField.notifier).state = title;
    final networkState = ref.watch(networkStatusProvider);
    if (networkState.value?.first != ConnectivityResult.none) {
      context.pushNamed(AppRoutes.destinationsList);
    }
  }
}
