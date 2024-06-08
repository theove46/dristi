import 'package:cached_network_image/cached_network_image.dart';
import 'package:dristi/src/core/base/base_consumer_stateful_widget.dart';
import 'package:dristi/src/core/constants/app_values.dart';
import 'package:dristi/src/core/global_widgets/shimmers.dart';
import 'package:dristi/src/core/routes/app_routes.dart';
import 'package:dristi/src/features/destinations/presentation/riverpod/destination_provider.dart';
import 'package:dristi/src/features/destinations/presentation/riverpod/destination_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class DestinationsList extends ConsumerStatefulWidget {
  const DestinationsList({super.key});

  @override
  ConsumerState createState() => _DestinationsListState();
}

class _DestinationsListState
    extends BaseConsumerStatefulWidget<DestinationsList> {
  @override
  Widget build(BuildContext context) {
    final destinationModelsItems = ref.watch(destinationProvider);

    if (destinationModelsItems.status != DestinationStatus.success ||
        destinationModelsItems.data == null) {
      return buildDestinationListShimmer(context);
    }

    return SliverPadding(
      padding: EdgeInsets.only(
        left: AppValues.dimen_8.r,
        right: AppValues.dimen_8.r,
        bottom: AppValues.dimen_16.r,
      ),
      sliver: SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: AppValues.dimen_80.r / AppValues.dimen_100.r,
        ),
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            return _buildDestinationCard(index);
          },
          childCount: destinationModelsItems.data.length,
        ),
      ),
    );
  }

  Widget _buildDestinationCard(int index) {
    return GestureDetector(
      onTap: navigateToSpotPage,
      child: Card(
        child: Stack(
          fit: StackFit.expand,
          children: [
            _buildImage(index),
            _buildGradient(),
            _buildLabels(index),
          ],
        ),
      ),
    );
  }

  Widget _buildImage(int index) {
    final destinationModelsItems = ref.watch(destinationProvider);
    final item = destinationModelsItems.data[index];
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppValues.dimen_16.r),
        border: Border.all(
          width: 0,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppValues.dimen_16.r),
        child: CachedNetworkImage(
          imageUrl: item.image,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildGradient() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppValues.dimen_16.r),
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          tileMode: TileMode.clamp,
          colors: [
            uiColors.shadow,
            uiColors.shadow.withOpacity(0.25),
            uiColors.transparent,
          ],
        ),
      ),
    );
  }

  Widget _buildLabels(int index) {
    final destinationModelsItems = ref.watch(destinationProvider);
    final item = destinationModelsItems.data[index];

    return Padding(
      padding: EdgeInsets.all(AppValues.dimen_10.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            item.title,
            style: appTextStyles.onImageNovaSemiBold16,
          ),
          Text(
            item.district,
            style: appTextStyles.onImageNovaRegular12,
          ),
        ],
      ),
    );
  }

  void navigateToSpotPage() {
    context.pushNamed(AppRoutes.spot);
  }
}
