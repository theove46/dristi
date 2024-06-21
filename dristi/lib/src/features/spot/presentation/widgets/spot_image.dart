import 'package:cached_network_image/cached_network_image.dart';
import 'package:dristi/src/core/base/base_stateful_widget.dart';
import 'package:dristi/src/core/constants/app_global_texts.dart';
import 'package:dristi/src/core/constants/app_values.dart';
import 'package:dristi/src/features/destinations/domain/entities/destination_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SpotImage extends StatefulWidget {
  const SpotImage({
    required this.destination,
    super.key,
  });

  final DestinationEntity destination;

  @override
  State<SpotImage> createState() => _SpotImageState();
}

class _SpotImageState extends BaseStatefulWidget<SpotImage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        _buildBackgroundImage(),
        _buildGalleryIcon(),
        _buildDestinationText(),
      ],
    );
  }

  Widget _buildBackgroundImage() {
    return Hero(
      tag: "${TextConstants.appName}-${widget.destination.id}",
      child: ClipRRect(
        child: CachedNetworkImage(
          imageUrl: widget.destination.image,
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
      child: GestureDetector(
        onTap: () {},
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
              ClipRRect(
                borderRadius: BorderRadius.circular(AppValues.dimen_10.r),
                child: SizedBox.fromSize(
                  size: Size.fromRadius(AppValues.dimen_48.r),
                  child: CachedNetworkImage(
                    imageUrl: widget.destination.image,
                    fit: BoxFit.cover,
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
          widget.destination.onImageTitle,
          style: appTextStyles.onImageBoldShadow44,
        ),
      ),
    );
  }
}
