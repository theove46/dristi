import 'package:cached_network_image/cached_network_image.dart';
import 'package:dristi/src/core/base/base_consumer_stateful_widget.dart';
import 'package:dristi/src/core/constants/app_global_texts.dart';
import 'package:dristi/src/core/constants/app_values.dart';
import 'package:dristi/src/core/global_entities/images_entity.dart';
import 'package:dristi/src/core/routes/app_routes.dart';
import 'package:dristi/src/features/destination/domain/entities/destination_entities.dart';
import 'package:dristi/src/features/accommodation/domain/entities/accommodation_entities.dart';
import 'package:dristi/src/features/accommodation/presentation/riverpod/accommodation_data/accommodation_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class AccommodationImage extends ConsumerStatefulWidget {
  const AccommodationImage({
    required this.hotel,
    super.key,
  });

  final AccommodationEntity hotel;

  @override
  ConsumerState createState() => _AccommodationImageState();
}

class _AccommodationImageState
    extends BaseConsumerStatefulWidget<AccommodationImage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        _buildBackgroundImage(),
        _buildDestinationText(),
        _buildGalleryIcon(),
      ],
    );
  }

  Widget _buildBackgroundImage() {
    return Hero(
      tag: "${TextConstants.appName}-${widget.hotel.id}",
      child: ClipRRect(
        child: CachedNetworkImage(
          imageUrl: widget.hotel.images!.first.url,
          fit: BoxFit.cover,
          height: AppValues.dimen_500.h,
          width: double.infinity,
        ),
      ),
    );
  }

  Widget _buildGalleryIcon() {
    return Positioned(
      bottom: AppValues.dimen_100.h,
      left: AppValues.dimen_16.w,
      child: Container(
        padding: EdgeInsets.all(AppValues.dimen_3.r),
        height: AppValues.dimen_75.r,
        width: AppValues.dimen_75.r,
        decoration: BoxDecoration(
          color: uiColors.onImage,
          borderRadius: BorderRadius.circular(AppValues.dimen_12.r),
        ),
        child: Stack(
          children: [
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                navigateToGallery();
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(AppValues.dimen_10.r),
                child: SizedBox.fromSize(
                  size: Size.fromRadius(AppValues.dimen_48.r),
                  child: CachedNetworkImage(
                    imageUrl: widget.hotel.images!.first.url,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Center(
              child: Icon(
                Icons.more_horiz_outlined,
                color: uiColors.onImage,
                size: AppValues.dimen_32.h,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDestinationText() {
    return Positioned(
      bottom: AppValues.dimen_60.h,
      right: AppValues.dimen_16.w,
      child: Transform.rotate(
        angle: -15 * (3.1415926535 / 180),
        child: Text(
          widget.hotel.onImageTitle,
          style: appTextStyles.onImageBoldShadow44,
        ),
      ),
    );
  }

  void navigateToGallery() {
    final hotelDataState = ref.watch(accommodationProvider);
    final List<ImagesEntity> images = hotelDataState.data.images ?? [];
    context.pushNamed(
      AppRoutes.gallery,
      extra: GalleryScreenEntity(
        galleryName: hotelDataState.data.title,
        images: images,
      ),
    );
  }
}
