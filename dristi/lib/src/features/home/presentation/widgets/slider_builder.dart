import 'package:carousel_slider/carousel_slider.dart';
import 'package:dristi/src/core/services/routes/routes.dart';
import 'package:dristi/src/core/theme/colors.dart';
import 'package:dristi/src/core/theme/font_style.dart';
import 'package:dristi/src/features/home/presentation/riverpod/home_provider.dart';
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
        SizedBox(height: 10.h),
        _buildSliderIndicator(),
      ],
    );
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
                padding: EdgeInsets.symmetric(horizontal: 1.sp),
                child: Container(
                  height: 8.sp,
                  width: currentSliderState == index ? 24.sp : 12.sp,
                  decoration: BoxDecoration(
                    color: currentSliderState == index
                        ? UIColors.primary
                        : UIColors.white,
                    borderRadius: BorderRadius.circular(2.r),
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
                        borderRadius: BorderRadius.all(Radius.circular(10.h)),
                        child: Image.asset(
                          item.image,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 16.sp,
                      right: 16.sp,
                      child: Transform.rotate(
                        angle: -15 * (3.1415926535 / 180),
                        child: Text(
                          carouselItems.data[index].title,
                          style: AppTypography.bold32VibesWithShadow(
                            color: UIColors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
            options: CarouselOptions(
              height: 200.h,
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

  void navigateToSpotPage() {
    Navigator.pushNamed(
      context,
      Routes.spot,
    );
  }
}
