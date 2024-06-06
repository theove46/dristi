import 'package:dristi/src/core/base/base_consumer_stateful_widget.dart';
import 'package:dristi/src/core/constants/app_assets.dart';
import 'package:dristi/src/core/constants/app_values.dart';
import 'package:dristi/src/core/routes/app_routes.dart';
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

    return districtModelsState.data != null
        ? SliverPadding(
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
                      _buildDistrictCard(startIndex),
                      if (endIndex < districtModelsState.data.length)
                        _buildDistrictCard(endIndex),
                    ],
                  );
                },
                childCount: (districtModelsState.data.length / 2).ceil(),
              ),
            ),
          )
        : const SliverToBoxAdapter(
            child: SizedBox.shrink(),
          );
  }

  Widget _buildDistrictCard(int index) {
    final districtModelsState = ref.watch(districtProvider);
    final item = districtModelsState.data[index];

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
              navigateToDestinationsPage();
            },
          ),
        ),
      ),
    );
  }

  void navigateToDestinationsPage() {
    context.pushNamed(AppRoutes.destination);
  }
}
