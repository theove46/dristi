import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dristi/src/core/base/base_consumer_stateful_widget.dart';
import 'package:dristi/src/core/constants/app_values.dart';
import 'package:dristi/src/core/routes/app_routes.dart';
import 'package:dristi/src/core/global_widgets/shimmers.dart';
import 'package:dristi/src/features/home/advertisements/domain/entity/advertisement_entity.dart';
import 'package:dristi/src/features/home/advertisements/presentation/riverpod/advertisement_state.dart';
import 'package:dristi/src/features/home/home_screen/riverpod/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class AdvertisementBuilder extends ConsumerStatefulWidget {
  const AdvertisementBuilder({super.key});

  @override
  ConsumerState createState() => _ImageAdvertisementBuilderState();
}

class _ImageAdvertisementBuilderState
    extends BaseConsumerStatefulWidget<AdvertisementBuilder> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildCarouselAdvertisement(),
      ],
    );
  }

  Widget _buildCarouselAdvertisement() {
    final currentAdvertisementNotifier =
        ref.read(currentAdvertisementProvider.notifier);
    final carouselItems = ref.watch(advertisementProvider);

    if (carouselItems.status != AdvertisementStatus.success ||
        carouselItems.data == null) {
      return buildAdvertisementShimmer(context);
    }

    return Stack(
      alignment: Alignment.topRight,
      children: [
        CarouselSlider.builder(
          itemCount: carouselItems.data.length,
          itemBuilder: (context, index, realIndex) {
            final item = carouselItems.data[index];
            return Padding(
              padding: EdgeInsets.only(top: AppValues.dimen_16.h),
              child: GestureDetector(
                onTap: () {
                  navigateToWebView(item: item);
                },
                child: SizedBox(
                  width: double.infinity,
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(
                      Radius.circular(AppValues.dimen_10.r),
                    ),
                    child: CachedNetworkImage(
                      imageUrl: item.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            );
          },
          options: CarouselOptions(
            height: AppValues.dimen_130.h,
            aspectRatio: 2,
            viewportFraction: 1,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 5),
            autoPlayAnimationDuration: const Duration(seconds: 2),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            onPageChanged: (index, reason) {
              currentAdvertisementNotifier.state = index;
            },
            scrollDirection: Axis.horizontal,
          ),
        ),
        Positioned(
          bottom: AppValues.dimen_16.r,
          right: AppValues.dimen_16.r,
          child: _buildAdvertisementIndicator(),
        ),
      ],
    );
  }

  Widget _buildAdvertisementIndicator() {
    final currentAdvertisementState = ref.watch(currentAdvertisementProvider);
    final carouselItems = ref.watch(advertisementProvider);

    if (carouselItems.status != AdvertisementStatus.success ||
        carouselItems.data == null) {
      return buildSliderIndicatorShimmer(context);
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        carouselItems.data.length,
        (index) => Padding(
          padding: EdgeInsets.symmetric(horizontal: AppValues.dimen_2.w),
          child: Container(
            height: AppValues.dimen_6.h,
            width: currentAdvertisementState == index
                ? AppValues.dimen_40.w
                : AppValues.dimen_6.w,
            decoration: BoxDecoration(
              color: currentAdvertisementState == index
                  ? uiColors.onImage
                  : uiColors.onImage.withOpacity(0.6),
              borderRadius: BorderRadius.circular(AppValues.dimen_3.r),
            ),
          ),
        ),
      ),
    );
  }

  void navigateToWebView({required AdvertisementEntity item}) {
    context.pushNamed(AppRoutes.webView, extra: item);
  }
}
