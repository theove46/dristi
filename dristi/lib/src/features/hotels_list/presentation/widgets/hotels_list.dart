import 'package:cached_network_image/cached_network_image.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dristi/src/core/base/base_consumer_stateful_widget.dart';
import 'package:dristi/src/core/constants/app_global_texts.dart';
import 'package:dristi/src/core/constants/app_values.dart';
import 'package:dristi/src/core/global_providers/favourite_places/favourites_provider.dart';
import 'package:dristi/src/core/global_providers/network_status/network_status_provider.dart';
import 'package:dristi/src/core/global_widgets/sliver_empty_list_image.dart';
import 'package:dristi/src/core/global_widgets/shimmers.dart';
import 'package:dristi/src/features/hotels_list/domain/entities/hotels_list_entity.dart';
import 'package:dristi/src/features/hotels_list/presentation/riverpod/hotels_list_provider.dart';
import 'package:dristi/src/features/hotels_list/presentation/riverpod/hotels_list_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HotelsList extends ConsumerStatefulWidget {
  const HotelsList({
    super.key,
  });

  @override
  ConsumerState createState() => _HotelsListState();
}

class _HotelsListState extends BaseConsumerStatefulWidget<HotelsList> {
  @override
  Widget build(BuildContext context) {
    final hotelsModelsItems = ref.watch(hotelsListProvider);

    if (hotelsModelsItems.status != HotelsListStatus.success ||
        hotelsModelsItems.data == null) {
      return buildHotelsListShimmer(context);
    }

    List<HotelEntity> fetchResult = searchHotels();

    if (fetchResult.isEmpty) {
      return const SliverEmptyListImage();
    }

    return SliverPadding(
      padding: EdgeInsets.only(
        left: AppValues.dimen_16.r,
        right: AppValues.dimen_16.r,
        bottom: AppValues.dimen_16.r,
      ),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            return _buildHotelsCard(fetchResult[index]);
          },
          childCount: fetchResult.length,
        ),
      ),
    );
  }

  Widget _buildHotelsCard(HotelEntity item) {
    return GestureDetector(
      onTap: () {
        navigateToHotelPage(item.id);
      },
      child: Card(
        margin: EdgeInsets.symmetric(vertical: AppValues.dimen_8.r),
        child: SizedBox(
          height: AppValues.dimen_160.r,
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
      ),
    );
  }

  Widget _buildImage(HotelEntity item) {
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

  Widget _buildFavouriteIcon(HotelEntity item) {
    final isFavorite = ref.watch(favoritesProvider).data.contains(item.id);

    return GestureDetector(
      onTap: () {
        ref.read(favoritesProvider.notifier).toggleFavorite(item.id);
      },
      child: Padding(
        padding: EdgeInsets.all(AppValues.dimen_16.r),
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

  Widget _buildLabels(HotelEntity item) {
    return Padding(
      padding: EdgeInsets.all(AppValues.dimen_16.w),
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

  List<HotelEntity> searchHotels() {
    final hotelsModelsItems = ref.watch(hotelsListProvider);
    final searchFieldState = ref.watch(hotelsListSearchField);
    final districtFieldState = ref.watch(hotelsListDistrictField);
    final favoriteHotelsState = ref.watch(favoritesProvider).data;
    final isShowFavouriteHotelsState = ref.watch(favouriteHotelsList);

    List<HotelEntity> result = hotelsModelsItems.data.where((u) {
      var checkTitle = u.title.toLowerCase();
      var checkDistrict = u.district.toLowerCase();
      var checkDivision = u.division.toLowerCase();

      bool matchesSearch =
          checkTitle.contains(searchFieldState.toLowerCase()) ||
              checkDistrict.contains(searchFieldState.toLowerCase()) ||
              checkDivision.contains(searchFieldState.toLowerCase());

      bool matchesDistrict = districtFieldState.isEmpty ||
          checkDistrict.contains(districtFieldState.toLowerCase());

      bool matchesFavourites =
          !isShowFavouriteHotelsState || favoriteHotelsState.contains(u.id);

      return matchesSearch && matchesDistrict && matchesFavourites;
    }).toList();

    return result;
  }

  void navigateToHotelPage(String id) {
    final networkState = ref.watch(networkStatusProvider);
    if (networkState.value?.first != ConnectivityResult.none) {
      //context.pushNamed(AppRoutes.hotelScreen, extra: id);
    }
  }
}
