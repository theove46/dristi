import 'package:cached_network_image/cached_network_image.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dristi/src/core/base/base_consumer_stateful_widget.dart';
import 'package:dristi/src/core/constants/app_global_texts.dart';
import 'package:dristi/src/core/constants/app_values.dart';
import 'package:dristi/src/core/global_providers/favourite_places/favourites_provider.dart';
import 'package:dristi/src/core/global_providers/network_status/network_status_provider.dart';
import 'package:dristi/src/core/global_widgets/empty_list_image.dart';
import 'package:dristi/src/core/global_widgets/shimmers.dart';
import 'package:dristi/src/core/routes/app_routes.dart';
import 'package:dristi/src/features/destinations/domain/entities/destination_entity.dart';
import 'package:dristi/src/features/destinations/presentation/riverpod/destination_provider.dart';
import 'package:dristi/src/features/destinations/presentation/riverpod/destination_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class DestinationsList extends ConsumerStatefulWidget {
  const DestinationsList({
    this.isShowFavouritesList,
    super.key,
  });

  final bool? isShowFavouritesList;

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

    List<DestinationEntity> fetchResult = searchDestinations();

    if (fetchResult.isEmpty) {
      return const EmptyListImage();
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
            return _buildDestinationCard(fetchResult[index]);
          },
          childCount: fetchResult.length,
        ),
      ),
    );
  }

  Widget _buildDestinationCard(DestinationEntity item) {
    return GestureDetector(
      onTap: () {
        navigateToSpotPage(item);
      },
      child: Card(
        child: Stack(
          fit: StackFit.expand,
          children: [
            _buildImage(item),
            _buildGradient(),
            _buildFavouriteIcon(item),
            _buildLabels(item),
          ],
        ),
      ),
    );
  }

  Widget _buildImage(DestinationEntity item) {
    return Hero(
      tag: "${TextConstants.appName}-${item.id}",
      child: Container(
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

  Widget _buildFavouriteIcon(DestinationEntity item) {
    final isFavorite = ref.watch(favoritesProvider).data.contains(item.id);

    return GestureDetector(
      onTap: () {
        ref.read(favoritesProvider.notifier).toggleFavorite(item.id);
      },
      child: Padding(
        padding: EdgeInsets.all(AppValues.dimen_10.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              height: AppValues.dimen_24.r,
              width: AppValues.dimen_24.r,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: uiColors.onImage.withOpacity(0.7),
              ),
              child: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border_outlined,
                color: uiColors.error,
                size: AppValues.dimen_16.r,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLabels(DestinationEntity item) {
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

  List<DestinationEntity> searchDestinations() {
    final destinationModelsItems = ref.watch(destinationProvider);
    final searchFieldState = ref.watch(destinationsSearchField);
    final categoryFieldState = ref.watch(destinationsCategoryField);
    final districtFieldState = ref.watch(destinationsDistrictField);
    final favoriteDestinationsState = ref.watch(favoritesProvider).data;

    List<DestinationEntity> result = destinationModelsItems.data.where((u) {
      var checkTitle = u.title.toLowerCase();
      var checkDistrict = u.district.toLowerCase();
      var checkDivision = u.division.toLowerCase();
      var checkCategory = u.category.toLowerCase();

      bool matchesSearch =
          checkTitle.contains(searchFieldState.toLowerCase()) ||
              checkDistrict.contains(searchFieldState.toLowerCase()) ||
              checkDivision.contains(searchFieldState.toLowerCase());

      bool matchesCategory = categoryFieldState.isEmpty ||
          checkCategory.contains(categoryFieldState.toLowerCase());

      bool matchesDistrict = districtFieldState.isEmpty ||
          checkDistrict.contains(districtFieldState.toLowerCase());

      bool matchesFavourites = !widget.isShowFavouritesList! ||
          favoriteDestinationsState.contains(u.id);

      return matchesSearch &&
          matchesCategory &&
          matchesDistrict &&
          matchesFavourites;
    }).toList();

    return result;
  }

  void navigateToSpotPage(DestinationEntity item) {
    final networkState = ref.watch(networkStatusProvider);
    if (networkState.value?.first != ConnectivityResult.none) {
      context.pushNamed(AppRoutes.spot, extra: item.id);
    }
  }
}
