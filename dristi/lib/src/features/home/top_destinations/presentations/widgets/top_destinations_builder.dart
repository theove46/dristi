import 'package:cached_network_image/cached_network_image.dart';
import 'package:dristi/src/core/base/base_consumer_stateful_widget.dart';
import 'package:dristi/src/core/constants/app_values.dart';
import 'package:dristi/src/core/routes/app_router.dart';
import 'package:dristi/src/core/routes/app_routes.dart';
import 'package:dristi/src/core/utils/localization_ext.dart';
import 'package:dristi/src/core/global_widgets/shimmers.dart';
import 'package:dristi/src/features/home/home_screen/riverpod/home_provider.dart';
import 'package:dristi/src/features/home/top_destinations/presentations/riverpod/top_destinations_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class TopDestinationBuilder extends ConsumerStatefulWidget {
  const TopDestinationBuilder({super.key});

  @override
  ConsumerState createState() => _TopDestinationBuilderState();
}

class _TopDestinationBuilderState
    extends BaseConsumerStatefulWidget<TopDestinationBuilder> {
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
            context.localization.topDestinations,
            style: appTextStyles.primaryNovaBold16,
          ),
          TextButton(
            onPressed: navigateToDestinationsPage,
            child: Text(
              context.localization.viewAll,
              style: appTextStyles.primaryNovaSemiBold12,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDestinations() {
    final topDestinationItems = ref.watch(topDestinationsProvider);

    if (topDestinationItems.status != TopDestinationsStatus.success ||
        topDestinationItems.data == null) {
      return buildTopDestinationsShimmer(context);
    }

    return SizedBox(
      height: AppValues.dimen_110.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: topDestinationItems.data.length,
        itemBuilder: (context, index) {
          final item = topDestinationItems.data[index];
          return Padding(
            padding: EdgeInsets.only(right: AppValues.dimen_8.w),
            child: GestureDetector(
              onTap: () {
                navigateToSpotPage(item.id);
              },
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(AppValues.dimen_16.r),
                    child: CachedNetworkImage(
                      imageUrl: item.image,
                      width: AppValues.dimen_80.r,
                      height: AppValues.dimen_80.r,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    width: AppValues.dimen_75.r,
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

  void navigateToDestinationsPage() {
    context.pushNamed(AppRoutes.destination);
  }

  void navigateToSpotPage(String id) {
    final instanceId = UniqueKey().toString();
    context.pushNamed(
      AppRoutes.spot,
      pathParameters: {
        PathParameter.spotId: id,
        PathParameter.instanceId: instanceId
      },
    );
  }
}
