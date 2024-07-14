import 'package:dristi/src/core/base/base_consumer_stateful_widget.dart';
import 'package:dristi/src/core/constants/app_values.dart';
import 'package:dristi/src/core/global_entities/gallery_screen_entity.dart';
import 'package:dristi/src/core/global_widgets/shimmers.dart';
import 'package:dristi/src/core/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';

class GalleryScreen extends ConsumerStatefulWidget {
  final GalleryScreenEntity? arguments;

  const GalleryScreen({
    super.key,
    required this.arguments,
  });

  @override
  ConsumerState createState() => _GalleryScreenState();
}

class _GalleryScreenState extends BaseConsumerStatefulWidget<GalleryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _buildAppBar(),
          _buildImageGallery(),
        ],
      ),
    );
  }

  Widget _buildAppBar() {
    return SliverAppBar(
      floating: true,
      automaticallyImplyLeading: false,
      expandedHeight: AppValues.dimen_70.h,
      flexibleSpace: FlexibleSpaceBar(
        background: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              context.pop();
            },
          ),
          title: Text(
            widget.arguments?.galleryName ?? '',
            style: appTextStyles.primaryNovaBold16,
          ),
        ),
      ),
    );
  }

  Widget _buildImageGallery() {
    if (widget.arguments == null) {
      return SliverToBoxAdapter(
        child: buildFullScreenShimmer(context),
      );
    }

    return SliverPadding(
      padding: EdgeInsets.all(AppValues.dimen_16.r),
      sliver: SliverMasonryGrid.count(
        crossAxisCount: 2,
        mainAxisSpacing: AppValues.dimen_12.r,
        crossAxisSpacing: AppValues.dimen_12.r,
        childCount: widget.arguments!.images.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              navigateToImageView(index);
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(AppValues.dimen_10.r),
              child: SizedBox.fromSize(
                child: CachedNetworkImage(
                  imageUrl: widget.arguments!.images[index].url,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void navigateToImageView(int index) {
    context.pushNamed(
      AppRoutes.imageView,
      extra: GalleryScreenEntity(
        galleryName: widget.arguments!.galleryName,
        images: widget.arguments!.images,
        initialIndex: index,
      ),
    );
  }
}
