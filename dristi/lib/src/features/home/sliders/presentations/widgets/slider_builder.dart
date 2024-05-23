import 'package:carousel_slider/carousel_slider.dart';
import 'package:dristi/src/core/constants/app_values.dart';
import 'package:dristi/src/core/routes/app_routes.dart';
import 'package:dristi/src/core/styles/colors.dart';
import 'package:dristi/src/core/styles/texts.dart';
import 'package:dristi/src/core/widgets/shimmers.dart';
import 'package:dristi/src/features/home/home_screen/riverpod/home_provider.dart';
import 'package:dristi/src/features/home/sliders/presentations/riverpod/slider_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SliderBuilder extends ConsumerStatefulWidget {
  const SliderBuilder({super.key});

  @override
  ConsumerState createState() => _ImageSliderBuilderState();
}

class _ImageSliderBuilderState extends ConsumerState<SliderBuilder> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildCarouselSlider(),
        SizedBox(height: AppValues.dimen_10.h),
        _buildSliderIndicator(),
      ],
    );
  }

  Widget _buildCarouselSlider() {
    final currentSliderNotifier = ref.read(currentSlideProvider.notifier);
    final carouselItems = ref.watch(sliderProvider);

    if (carouselItems.status != SliderStatus.success ||
        carouselItems.data == null) {
      return buildSliderShimmer();
    }

    return CarouselSlider.builder(
      itemCount: carouselItems.data.length,
      itemBuilder: (context, index, realIndex) {
        final item = carouselItems.data[index];
        return GestureDetector(
          onTap: navigateToSpotPage,
          child: Stack(
            alignment: Alignment.topRight,
            children: [
              SizedBox(
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(
                    Radius.circular(AppValues.dimen_10.r),
                  ),
                  child: Image.network(
                    item.image,
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
                    carouselItems.data[index].title,
                    style: AppTextStyles(context).tertiaryVibesBoldShadow32,
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
      return buildSliderIndicatorShimmer();
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        carouselItems.data.length,
        (index) => Padding(
          padding: EdgeInsets.symmetric(horizontal: AppValues.dimen_1.w),
          child: Container(
            height: AppValues.dimen_12.h,
            width: currentSliderState == index
                ? AppValues.dimen_50.w
                : AppValues.dimen_28.w,
            decoration: BoxDecoration(
              color: currentSliderState == index
                  ? UIColors.primary
                  : UIColors.tertiary,
              borderRadius: BorderRadius.circular(AppValues.dimen_5.r),
              border: Border.all(
                color: UIColors.primary,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void navigateToSpotPage() {
    Navigator.pushNamed(
      context,
      AppRoutes.spot,
    );
  }
}
