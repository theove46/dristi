import 'package:dristi/src/core/base/base_consumer_stateful_widget.dart';
import 'package:dristi/src/core/constants/app_values.dart';
import 'package:dristi/src/core/global_entities/gallery_screen_entity.dart';
import 'package:dristi/src/core/global_entities/images_entity.dart';
import 'package:dristi/src/core/global_providers/favourites_items/favourites_items_provider.dart';
import 'package:dristi/src/core/global_providers/language_settings/language_settings_provider.dart';
import 'package:dristi/src/core/global_widgets/advertisement_image.dart';
import 'package:dristi/src/core/global_widgets/shimmers.dart';
import 'package:dristi/src/core/global_widgets/spot_screen_image.dart';
import 'package:dristi/src/core/global_widgets/spot_screen_top_icons.dart';
import 'package:dristi/src/core/routes/app_routes.dart';
import 'package:dristi/src/core/utils/localization_ext.dart';
import 'package:dristi/src/features/home/home_screen/riverpod/home_provider.dart';
import 'package:dristi/src/features/accommodation/presentation/riverpod/accommodation_data/accommodation_provider.dart';
import 'package:dristi/src/features/accommodation/presentation/widgets/accommodation_details_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class AccommodationScreen extends ConsumerStatefulWidget {
  const AccommodationScreen({
    required this.id,
    required this.instanceId,
    super.key,
  });

  final String id;
  final String instanceId;

  @override
  ConsumerState createState() => _AccommodationScreenState();
}

class _AccommodationScreenState
    extends BaseConsumerStatefulWidget<AccommodationScreen> {
  @override
  void initState() {
    super.initState();
    Future(() {
      fetchComponents();
    });
  }

  Future<void> fetchComponents() async {
    final appLanguageState =
        ref.watch(languageProvider).language.toLanguage.languageCode;
    ref.read(accommodationProvider.notifier).getAccommodationData(
          appLanguageState,
          widget.id,
        );
    ref
        .read(singleAdvertisementProvider.notifier)
        .getSingleAdvertisementComponents();
  }

  @override
  Widget build(BuildContext context) {
    final accommodationDataState = ref.watch(accommodationProvider);

    if (accommodationDataState.data == null) {
      return buildFullScreenShimmer(context);
    }

    return Scaffold(
      body: Stack(
        children: [
          SpotScreenImage(
            stateData: accommodationDataState.data,
          ),
          _buildDescription(),
          SpotScreenTopIcons(
            itemId: widget.id,
            isFavoriteProvider: (id) =>
                ref.watch(favouriteItemsProvider).data.contains(widget.id),
            onFavoriteToggle: (id) {
              ref
                  .read(favouriteItemsProvider.notifier)
                  .toggleFavouritesItems(widget.id);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildDescription() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              navigateToGallery();
            },
            child: Container(
              height: AppValues.dimen_480.h,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: uiColors.secondary,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(AppValues.dimen_20.r),
                topRight: Radius.circular(AppValues.dimen_20.r),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(AppValues.dimen_16.r),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AdvertisementImage(),
                  AccommodationScreenDetailsBuilder(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void navigateToGallery() {
    final accommodationDataState = ref.watch(accommodationProvider);
    final List<ImagesEntity> images = accommodationDataState.data.images ?? [];
    context.pushNamed(
      AppRoutes.gallery,
      extra: GalleryScreenEntity(
        galleryName: accommodationDataState.data.title,
        images: images,
      ),
    );
  }
}
