import 'package:carousel_slider/carousel_slider.dart';
import 'package:dristi/src/core/base/base_consumer_stateful_widget.dart';
import 'package:dristi/src/core/constants/app_values.dart';
import 'package:dristi/src/core/global_widgets/asset_image_view.dart';
import 'package:dristi/src/features/on_boarding/presentation/riverpod/on_boarding_providers.dart';
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
    final onBoardingModelsState = ref.watch(onBoardingProvider);
    final currentOnBoardingScreenNotifier =
        ref.watch(currentOnBoardingScreenProvider.notifier);

    if (onBoardingModelsState.data != null) {
      return CarouselSlider.builder(
        itemCount: onBoardingModelsState.data.length,
        itemBuilder: (context, index, realIndex) {
          return Stack(
            alignment: Alignment.topCenter,
            children: [
              ClipRRect(
                child: AssetImageView(
                  fileName: onBoardingModelsState.data[index].image,
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
                    onBoardingModelsState.data[index].title,
                    style: appTextStyles.onImageBoldShadow60,
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
            currentOnBoardingScreenNotifier.state = index;
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
            uiColors.shadow,
            uiColors.shadow.withOpacity(0.8),
            uiColors.shadow.withOpacity(0.8),
            uiColors.shadow.withOpacity(0.5),
            uiColors.shadow.withOpacity(0.2),
            uiColors.onImage.withOpacity(0.0),
            uiColors.onImage.withOpacity(0.0),
            uiColors.onImage.withOpacity(0.0),
          ],
        ),
      ),
    );
  }
}
