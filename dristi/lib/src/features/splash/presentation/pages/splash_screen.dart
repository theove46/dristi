import 'package:dristi/src/core/constants/app_values.dart';
import 'package:dristi/src/core/services/routes/app_routes.dart';
import 'package:dristi/src/core/theme/colors.dart';
import 'package:dristi/src/core/theme/text_styles.dart';
import 'package:dristi/src/core/utils/localization_ext.dart';
import 'package:dristi/src/core/widgets/button.dart';
import 'package:dristi/src/core/widgets/primary_snackbar.dart';
import 'package:dristi/src/features/splash/presentation/riverpod/splash_providers.dart';
import 'package:dristi/src/features/splash/presentation/riverpod/splash_state.dart';
import 'package:dristi/src/features/splash/presentation/widgets/image_view_builder.dart';
import 'package:dristi/src/features/splash/presentation/widgets/page_indicator_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    ref.read(splashProvider.notifier).getSplashComponents();
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
      bottom: AppValues.dimen_40.h,
      left: AppValues.dimen_0.w,
      right: AppValues.dimen_0.w,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppValues.dimen_28.w),
        child: Button(
          onPressed: notifier.splashPageSubmit,
          background: UIColors.primary,
          height: AppValues.dimen_60.h,
          label: context.localization.getStarted,
          textStyle: whiteNovaBold20,
        ),
      ),
    );
  }

  Widget _buildTopName() {
    return Padding(
      padding: EdgeInsets.only(
        top: AppValues.dimen_40.h,
        left: AppValues.dimen_16.w,
      ),
      child: Align(
        alignment: Alignment.topLeft,
        child: Text(
          context.localization.appName,
          style: whiteNovaBold28,
        ),
      ),
    );
  }

  void navigateToHomePage() {
    context.pushNamed(AppRoutes.home);
  }
}
