import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dristi/src/core/base/base_consumer_stateful_widget.dart';
import 'package:dristi/src/core/constants/app_values.dart';
import 'package:dristi/src/core/routes/app_router.dart';
import 'package:dristi/src/core/routes/app_routes.dart';
import 'package:dristi/src/core/global_widgets/shimmers.dart';
import 'package:dristi/src/features/home/home_screen/riverpod/home_provider.dart';
import 'package:dristi/src/features/home/sliders/presentations/riverpod/slider_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SliderBuilder extends ConsumerStatefulWidget {
  const SliderBuilder({super.key});

  @override
  ConsumerState createState() => _ImageSliderBuilderState();
}

class _ImageSliderBuilderState
    extends BaseConsumerStatefulWidget<SliderBuilder> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            _buildCarouselSlider(),
            Positioned(
              bottom: AppValues.dimen_16.h,
              left: AppValues.dimen_16.w,
              child: _buildSliderIndicator(),
            ),
          ],
        ),
        SizedBox(height: AppValues.dimen_4.h),
      ],
    );
  }

  Widget _buildCarouselSlider() {
    final currentSliderNotifier = ref.read(currentSlideProvider.notifier);
    final carouselItems = ref.watch(sliderProvider);

    if (carouselItems.status != SliderStatus.success ||
        carouselItems.data == null) {
      return buildHomeScreenSliderShimmer(context);
    }

    return CarouselSlider.builder(
      itemCount: carouselItems.data.length,
      itemBuilder: (context, index, realIndex) {
        final item = carouselItems.data[index];
        return GestureDetector(
          onTap: () {
            navigateToDestinationScreen(item.id);
          },
          child: Stack(
            alignment: Alignment.topRight,
            children: [
              SizedBox(
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
              Positioned(
                bottom: AppValues.dimen_16.h,
                right: AppValues.dimen_16.w,
                child: Transform.rotate(
                  angle: -15 * (3.1415926535 / 180),
                  child: Text(
                    carouselItems.data[index].onImageTitle,
                    style: appTextStyles.onImageBoldShadow32,
                  ),
                ),
              ),
            ],
          ),
        );
      },
      options: CarouselOptions(
        height: AppValues.dimen_220.h,
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
          currentSliderNotifier.state = index;
        },
        scrollDirection: Axis.horizontal,
      ),
    );
  }

  Widget _buildSliderIndicator() {
    final currentSliderState = ref.watch(currentSlideProvider);
    final carouselItems = ref.watch(sliderProvider);

    if (carouselItems.status != SliderStatus.success ||
        carouselItems.data == null) {
      return buildSliderIndicatorShimmer(context);
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        carouselItems.data.length,
        (index) {
          double width;

          if (index == currentSliderState) {
            width = AppValues.dimen_40.r;
          } else {
            width = AppValues.dimen_6.r;
          }

          return Padding(
            padding: EdgeInsets.symmetric(horizontal: AppValues.dimen_1.w),
            child: Container(
              height: AppValues.dimen_6.r,
              width: width,
              decoration: BoxDecoration(
                color: currentSliderState == index
                    ? uiColors.light
                    : uiColors.light.withOpacity(0.6),
                borderRadius: BorderRadius.circular(AppValues.dimen_5.r),
              ),
            ),
          );
        },
      ),
    );
  }

  void navigateToDestinationScreen(String id) {
    final instanceId = UniqueKey().toString();
    context.pushNamed(
      AppRoutes.destination,
      pathParameters: {
        PathParameter.destinationId: id,
        PathParameter.instanceId: instanceId
      },
    );
  }
}
