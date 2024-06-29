import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dristi/src/core/base/base_consumer_stateful_widget.dart';
import 'package:dristi/src/core/constants/app_global_texts.dart';
import 'package:dristi/src/core/constants/app_values.dart';
import 'package:dristi/src/core/global_widgets/primary_snackbar.dart';
import 'package:dristi/src/core/routes/app_router.dart';
import 'package:dristi/src/core/utils/localization_ext.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gal/gal.dart';
import 'package:go_router/go_router.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class ImageViewerScreen extends ConsumerStatefulWidget {
  final GalleryScreenArguments? arguments;

  const ImageViewerScreen({
    required this.arguments,
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _ImageViewerScreenState();
}

class _ImageViewerScreenState
    extends BaseConsumerStatefulWidget<ImageViewerScreen> {
  late PageController _pageController;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.arguments!.initialIndex;
    _pageController = PageController(initialPage: currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            context.pop();
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.download),
            onPressed: () async {
              final path =
                  '${Directory.systemTemp.path}/${widget.arguments!.galleryName}_${currentIndex}_Credit_name.jpg';
              final url = widget.arguments!.images[currentIndex];
              await Dio().download(url, path);
              await Gal.putImage(path, album: TextConstants.appName);
              successSnackBar();
            },
          ),
        ],
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          _buildImageView(),
          _buildCredit(),
          _buildIndicatorsList(),
        ],
      ),
    );
  }

  Widget _buildCredit() {
    return Positioned(
      bottom: AppValues.dimen_80.r,
      left: AppValues.dimen_16.r,
      child: Text(
        'Credit: name',
        style: appTextStyles.secondaryNovaRegular16,
      ),
    );
  }

  Widget _buildImageView() {
    return PhotoViewGallery.builder(
      pageController: _pageController,
      itemCount: widget.arguments!.images.length,
      builder: (context, index) {
        return PhotoViewGalleryPageOptions(
          imageProvider: CachedNetworkImageProvider(
            widget.arguments!.images[index],
          ),
          minScale: PhotoViewComputedScale.contained * 0.6,
          maxScale: PhotoViewComputedScale.covered * 2,
        );
      },
      scrollPhysics: const BouncingScrollPhysics(),
      backgroundDecoration: BoxDecoration(
        color: uiColors.background,
      ),
      enableRotation: true,
      onPageChanged: (index) {
        setState(() {
          currentIndex = index;
        });
      },
    );
  }

  Widget _buildIndicatorsList() {
    return Positioned(
      bottom: AppValues.dimen_20.r,
      left: AppValues.dimen_16.r,
      right: AppValues.dimen_16.r,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
            ),
            onPressed: () {
              if (currentIndex > 0) {
                _pageController.previousPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              }
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              widget.arguments!.images.length,
              (index) => _buildCircleIndicator(
                index == currentIndex,
              ),
            ),
          ),
          IconButton(
            icon: const Icon(
              Icons.arrow_forward_ios,
            ),
            onPressed: () {
              if (currentIndex < widget.arguments!.images.length - 1) {
                _pageController.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _buildCircleIndicator(bool isActive) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: AppValues.dimen_4.r),
      width: isActive ? AppValues.dimen_8.r : AppValues.dimen_6.r,
      height: isActive ? AppValues.dimen_8.r : AppValues.dimen_6.r,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isActive ? uiColors.primary : uiColors.highlight,
      ),
    );
  }

  void successSnackBar() async {
    ShowSnackBarMessage.showSuccessSnackBar(
      message: context.localization.successfullyDownloaded,
      context: context,
    );
  }
}
