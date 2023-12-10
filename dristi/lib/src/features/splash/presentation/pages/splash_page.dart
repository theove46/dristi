import 'dart:async';

import 'package:dristi/src/core/services/routes/routes.dart';
import 'package:dristi/src/core/theme/colors.dart';
import 'package:dristi/src/core/theme/font_style.dart';
import 'package:dristi/src/core/utils/texts/text_constants.dart';
import 'package:dristi/src/core/widgets/button.dart';
import 'package:dristi/src/features/splash/data/model/on_boarding_model.dart';
import 'package:dristi/src/features/splash/presentation/riverpod/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({super.key});

  @override
  ConsumerState createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<SplashPage> {
  final PageController _pageController = PageController(initialPage: 0);
  final List<SplashModel> splashModels = SplashModel.fetchAllData();
  final int autoScrollDuration = 5000;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startAutoScroll();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startAutoScroll() {
    _timer = Timer.periodic(
      Duration(milliseconds: autoScrollDuration),
      (timer) {
        if (_pageController.page == splashModels.length - 1) {
          Future.delayed(const Duration(milliseconds: 700), () {
            _pageController.jumpToPage(0);
          });
        } else {
          _pageController.nextPage(
            duration: const Duration(milliseconds: 700),
            curve: Curves.ease,
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _buildImageView(),
          _buildPageIndicator(),
          _buildButton(),
          _buildTopName(),
        ],
      ),
    );
  }

  Widget _buildImageView() {
    final currentSplashNotifier = ref.watch(currentSplashProvider.notifier);

    return PageView.builder(
      pageSnapping: true,
      controller: _pageController,
      itemCount: splashModels.length,
      onPageChanged: (index) {
        currentSplashNotifier.state = index;
      },
      itemBuilder: (context, index) {
        return Stack(
          alignment: Alignment.topCenter,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.sp),
              child: Image.asset(
                splashModels[index].image,
                fit: BoxFit.cover,
                height: double.infinity,
                width: double.infinity,
              ),
            ),
            Positioned(
              bottom: 160.sp,
              child: Transform.rotate(
                angle: -15 * (3.1415926535 / 180),
                child: Text(
                  splashModels[index].title,
                  style: AppTypography.bold60VibesWithShadow(
                    color: splashModels[index].textColor,
                  ),
                ),
              ),
            ),
            _buildGradient(),
          ],
        );
      },
    );
  }

  Widget _buildPageIndicator() {
    final currentSplashState = ref.watch(currentSplashProvider);

    return Positioned(
      bottom: 120.sp,
      left: 0.sp,
      right: 0.sp,
      child: Align(
        alignment: Alignment.center,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                splashModels.length,
                (index) => Padding(
                  padding: EdgeInsets.symmetric(horizontal: 1.sp),
                  child: Container(
                    height: 8.sp,
                    width: currentSplashState == index ? 40.sp : 20.sp,
                    decoration: BoxDecoration(
                      color: currentSplashState == index
                          ? UIColors.primary
                          : UIColors.white,
                      borderRadius: BorderRadius.circular(4.r),
                      border: Border.all(
                        color: UIColors.primary,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGradient() {
    return Container(
      decoration: BoxDecoration(
        gradient: RadialGradient(
          center: Alignment.topLeft,
          tileMode: TileMode.clamp,
          radius: 1.5,
          colors: [
            UIColors.primary,
            UIColors.primary.withOpacity(0.8),
            UIColors.primary.withOpacity(0.8),
            UIColors.primary.withOpacity(0.5),
            UIColors.primary.withOpacity(0.2),
            UIColors.black.withOpacity(0.0),
            UIColors.black.withOpacity(0.0),
            UIColors.black.withOpacity(0.0),
            // UIColors.primary,
          ],
        ),
      ),
    );
  }

  Widget _buildButton() {
    return Positioned(
      bottom: 40.sp,
      left: 0.sp,
      right: 0.sp,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 28.sp),
        child: Button(
          onPressed: navigateToHomePage,
          background: UIColors.primary,
          height: 60.h,
          label: TextConstants.getStarted,
          textStyle: AppTypography.bold20Nova(
            color: UIColors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildTopName() {
    return Padding(
      padding: EdgeInsets.only(
        top: 40.sp,
        left: 16.sp,
      ),
      child: Align(
        alignment: Alignment.topLeft,
        child: Text(
          TextConstants.appName,
          style: AppTypography.bold32Nova(
            color: UIColors.white,
          ),
        ),
      ),
    );
  }

  void navigateToHomePage() {
    Navigator.pushNamedAndRemoveUntil(
      context,
      Routes.home,
      (route) => false,
    );
  }
}
