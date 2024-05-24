import 'package:carousel_slider/carousel_slider.dart';
import 'package:dristi/src/core/base/base_consumer_stateful_widget.dart';
import 'package:dristi/src/core/constants/app_values.dart';
import 'package:dristi/src/core/styles/colors.dart';
import 'package:dristi/src/core/utils/asset_image_view.dart';
import 'package:dristi/src/features/splash/presentation/riverpod/splash_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImageViewBuilder extends ConsumerStatefulWidget {
  const ImageViewBuilder({super.key});

  @override
  ConsumerState createState() => _ImageViewBuilderState();
}

class _ImageViewBuilderState
    extends BaseConsumerStatefulWidget<ImageViewBuilder> {
  @override
  Widget build(BuildContext context) {
    final splashModelsState = ref.watch(splashProvider);
    final currentSplashNotifier = ref.watch(currentSplashProvider.notifier);

    if (splashModelsState.data != null) {
      return CarouselSlider.builder(
        itemCount: splashModelsState.data.length,
        itemBuilder: (context, index, realIndex) {
          return Stack(
            alignment: Alignment.topCenter,
            children: [
              ClipRRect(
                child: AssetImageView(
                  fileName: splashModelsState.data[index].image,
                  fit: BoxFit.cover,
                  height: double.infinity,
                  width: double.infinity,
                ),
              ),
              Positioned(
                bottom: AppValues.dimen_160.h,
                child: Transform.rotate(
                  angle: -15 * (3.1415926535 / 180),
                  child: Text(
                    splashModelsState.data[index].title,
                    style: appTextStyles.tertiaryVibesBoldShadow60,
                  ),
                ),
              ),
              _buildGradient(),
            ],
          );
        },
        options: CarouselOptions(
          height: double.infinity,
          aspectRatio: 5,
          viewportFraction: 1,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 3),
          autoPlayAnimationDuration: const Duration(seconds: 2),
          autoPlayCurve: Curves.fastOutSlowIn,
          onPageChanged: (index, reason) {
            currentSplashNotifier.state = index;
          },
          scrollDirection: Axis.horizontal,
        ),
      );
    } else {
      return Container();
    }
  }

  Widget _buildGradient() {
    return Container(
      decoration: BoxDecoration(
        gradient: RadialGradient(
          center: Alignment.topLeft,
          tileMode: TileMode.clamp,
          radius: 1.5.r,
          colors: [
            UIColors.primary,
            UIColors.primary.withOpacity(0.8),
            UIColors.primary.withOpacity(0.8),
            UIColors.primary.withOpacity(0.5),
            UIColors.primary.withOpacity(0.2),
            UIColors.onSecondary.withOpacity(0.0),
            UIColors.onSecondary.withOpacity(0.0),
            UIColors.onSecondary.withOpacity(0.0),
          ],
        ),
      ),
    );
  }
}
