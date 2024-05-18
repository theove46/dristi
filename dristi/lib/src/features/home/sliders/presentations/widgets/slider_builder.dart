import 'package:carousel_slider/carousel_slider.dart';
import 'package:dristi/src/core/constants/app_values.dart';
import 'package:dristi/src/core/services/routes/app_routes.dart';
import 'package:dristi/src/core/theme/colors.dart';
import 'package:dristi/src/core/theme/text_styles.dart';
import 'package:dristi/src/features/home/home_page/riverpod/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

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

    return carouselItems.data != null
        ? CarouselSlider.builder(
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
                          style: whiteVibesBoldShadow32,
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
          )
        : Container();
  }

  Widget _buildSliderIndicator() {
    final currentSliderState = ref.watch(currentSlideProvider);
    final carouselItems = ref.watch(sliderProvider);

    return carouselItems.data != null
        ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              carouselItems.data.length,
              (index) => Padding(
                padding: EdgeInsets.symmetric(horizontal: AppValues.dimen_1.w),
                child: Container(
                  height: AppValues.dimen_12.h,
                  width: currentSliderState == index
                      ? AppValues.dimen_40.w
                      : AppValues.dimen_28.w,
                  decoration: BoxDecoration(
                    color: currentSliderState == index
                        ? UIColors.primary
                        : UIColors.white,
                    borderRadius: BorderRadius.circular(AppValues.dimen_5.r),
                    border: Border.all(
                      color: UIColors.primary,
                    ),
                  ),
                ),
              ),
            ),
          )
        : Container();
  }

  void navigateToSpotPage() {
    context.pushNamed(AppRoutes.spot);
  }
}
