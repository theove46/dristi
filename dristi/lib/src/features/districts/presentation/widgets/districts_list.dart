import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dristi/src/core/base/base_consumer_stateful_widget.dart';
import 'package:dristi/src/core/constants/app_assets.dart';
import 'package:dristi/src/core/constants/app_values.dart';
import 'package:dristi/src/core/global_providers/network_status/network_status_provider.dart';
import 'package:dristi/src/core/global_providers/spots_providers/spot_providers.dart';
import 'package:dristi/src/core/global_widgets/sliver_empty_list_image.dart';
import 'package:dristi/src/core/global_widgets/shimmers.dart';
import 'package:dristi/src/core/routes/app_routes.dart';
import 'package:dristi/src/features/districts/domain/entities/district_entity.dart';
import 'package:dristi/src/features/districts/presentation/riverpod/district_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class DistrictsList extends ConsumerStatefulWidget {
  const DistrictsList({super.key});

  @override
  ConsumerState createState() => _DistrictsListState();
}

class _DistrictsListState extends BaseConsumerStatefulWidget<DistrictsList> {
  @override
  Widget build(BuildContext context) {
    final districtModelsState = ref.watch(districtProvider);

    if (districtModelsState.data == null) {
      return buildDistrictsListShimmer(context);
    }

    List<DistrictEntity> fetchResult = searchDistricts();

    if (fetchResult.isEmpty) {
      return const SliverEmptyListImage();
    }

    return SliverPadding(
      padding: EdgeInsets.only(
        left: AppValues.dimen_8.r,
        right: AppValues.dimen_8.r,
        bottom: AppValues.dimen_16.r,
      ),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            final int startIndex = index * 2;
            final int endIndex = startIndex + 1;
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildDistrictCard(fetchResult[startIndex]),
                if (endIndex < fetchResult.length)
                  _buildDistrictCard(fetchResult[endIndex]),
              ],
            );
          },
          childCount: (fetchResult.length / 2).ceil(),
        ),
      ),
    );
  }

  Widget _buildDistrictCard(DistrictEntity item) {
    return Expanded(
      child: Card(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppValues.dimen_16.r),
            color: uiColors.background,
            border: Border.all(
              color: uiColors.primary,
            ),
            image: const DecorationImage(
              image: AssetImage(Assets.forestCard),
              fit: BoxFit.contain,
              alignment: Alignment.bottomRight,
              opacity: 0.30,
            ),
          ),
          child: ListTile(
            title: Text(
              item.title,
              style: appTextStyles.primaryNovaSemiBold16,
            ),
            subtitle: Text(
              item.division,
              style: appTextStyles.secondaryNovaRegular12,
            ),
            onTap: () {
              navigateToDestinationsScreen(item.title);
            },
          ),
        ),
      ),
    );
  }

  List<DistrictEntity> searchDistricts() {
    final districtModelsState = ref.watch(districtProvider);
    final searchFieldState = ref.watch(districtsSearchField);

    List<DistrictEntity> result = districtModelsState.data.where((u) {
      var checkTitle = u.title.toLowerCase();
      var checkDistrict = u.title.toLowerCase();
      var checkDivision = u.division.toLowerCase();
      return checkTitle.contains(searchFieldState.toLowerCase()) ||
          checkDistrict.contains(searchFieldState.toLowerCase()) ||
          checkDivision.contains(searchFieldState.toLowerCase());
    }).toList();

    return result;
  }

  void navigateToDestinationsScreen(String title) {
    ref.watch(spotsListDistrictField);
    ref.read(spotsListDistrictField.notifier).state = title;
    final networkState = ref.watch(networkStatusProvider);
    if (networkState.value?.first != ConnectivityResult.none) {
      context.pushNamed(AppRoutes.destinationsList);
    }
  }
}
