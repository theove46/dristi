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
import 'package:dristi/src/features/destination/presentation/riverpod/destination_data/destination_provider.dart';
import 'package:dristi/src/features/destination/presentation/riverpod/destination_items/destination_item_provider.dart';
import 'package:dristi/src/features/destination/presentation/widgets/destination_items_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class DestinationScreen extends ConsumerStatefulWidget {
  const DestinationScreen({
    required this.id,
    required this.instanceId,
    super.key,
  });

  final String id;
  final String instanceId;

  @override
  ConsumerState createState() => _DestinationScreenState();
}

class _DestinationScreenState
    extends BaseConsumerStatefulWidget<DestinationScreen> {
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
    ref.read(destinationProvider.notifier).getDestinationData(
          appLanguageState,
          widget.id,
        );
    ref
        .read(destinationItemsProvider.notifier)
        .getDestinationItems(appLanguageState);
    ref
        .read(singleAdvertisementProvider.notifier)
        .getSingleAdvertisementComponents();
  }

  @override
  Widget build(BuildContext context) {
    final destinationDataState = ref.watch(destinationProvider);

    if (destinationDataState.data == null) {
      return buildFullScreenShimmer(context);
    }

    return Scaffold(
      body: Stack(
        children: [
          SpotScreenImage(
            stateData: destinationDataState.data,
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
    return DraggableScrollableSheet(
      initialChildSize: 0.5,
      minChildSize: 0.5,
      maxChildSize: 0.9,
      builder: (context, scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: uiColors.secondary,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(AppValues.dimen_20.r),
              topRight: Radius.circular(AppValues.dimen_20.r),
            ),
          ),
          child: SingleChildScrollView(
            controller: scrollController,
            child: Padding(
              padding: EdgeInsets.all(AppValues.dimen_16.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AdvertisementImage(),
                  DestinationScreenItemsBuilder(
                    instanceId: widget.instanceId,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void navigateToGallery() {
    final destinationDataState = ref.watch(destinationProvider);
    final List<ImagesEntity> images = destinationDataState.data.images ?? [];
    context.pushNamed(
      AppRoutes.gallery,
      extra: GalleryScreenEntity(
        galleryName: destinationDataState.data.title,
        images: images,
      ),
    );
  }
}
