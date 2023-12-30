import 'package:dristi/src/core/services/routes/routes.dart';
import 'package:dristi/src/core/theme/colors.dart';
import 'package:dristi/src/core/theme/font_style.dart';
import 'package:dristi/src/core/utils/texts/text_constants.dart';
import 'package:dristi/src/core/widgets/button.dart';
import 'package:dristi/src/core/widgets/primary_snackbar.dart';
import 'package:dristi/src/features/splash/presentation/riverpod/splash_providers.dart';
import 'package:dristi/src/features/splash/presentation/riverpod/splash_state.dart';
import 'package:dristi/src/features/splash/presentation/widgets/image_view_builder.dart';
import 'package:dristi/src/features/splash/presentation/widgets/page_indicator_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({super.key});

  @override
  ConsumerState createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future(() {
      ref.read(splashProvider.notifier).getSplashComponents();
    });
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(splashProvider);

    ref.listen(
      splashProvider,
      (_, next) {
        if (next.status == SplashStatus.success) {
          navigateToHomePage();
        } else if (next.status == SplashStatus.failure) {
          ShowSnackBarMessage.showErrorSnackBar(
            message: next.errorMessage!,
            context: context,
          );
        }
      },
    );

    return Scaffold(
      backgroundColor: UIColors.primary,
      body: Stack(
        children: [
          const ImageViewBuilder(),
          const PageIndicatorBuilder(),
          _buildButton(),
          _buildTopName(),
        ],
      ),
    );
  }

  Widget _buildButton() {
    final notifier = ref.read(splashProvider.notifier);

    return Positioned(
      bottom: 40.sp,
      left: 0.sp,
      right: 0.sp,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 28.sp),
        child: Button(
          onPressed: notifier.splashPageSubmit,
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
          style: AppTypography.bold28Nova(
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
