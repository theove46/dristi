import 'package:carousel_slider/carousel_slider.dart';
import 'package:dristi/src/core/services/routes/routes.dart';
import 'package:dristi/src/core/theme/colors.dart';
import 'package:dristi/src/core/theme/font_style.dart';
import 'package:dristi/src/features/home/data/model/carousel_slider_model.dart';
import 'package:dristi/src/features/home/presentation/riverpod/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImageSliderBuilder extends ConsumerStatefulWidget {
  const ImageSliderBuilder({super.key});

  @override
  ConsumerState createState() => _ImageSliderBuilderState();
}

class _ImageSliderBuilderState extends ConsumerState<ImageSliderBuilder> {
  final List<CarouselModel> carouselItems = CarouselModel.fetchAllData();

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

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        carouselItems.length,
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
    );
  }

  Widget _buildCarouselSlider() {
    final currentSliderNotifier = ref.read(currentSlideProvider.notifier);

    return CarouselSlider.builder(
      itemCount: carouselItems.length,
      itemBuilder: (context, index, realIndex) {
        final item = carouselItems[index];
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
                    carouselItems[index].title,
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
    );
  }

  void navigateToSpotPage() {
    Navigator.pushNamed(
      context,
      Routes.spot,
    );
  }
}
