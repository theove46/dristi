import 'package:dristi/src/core/base/base_consumer_stateful_widget.dart';
import 'package:dristi/src/core/constants/app_values.dart';
import 'package:dristi/src/core/routes/app_routes.dart';
import 'package:dristi/src/core/utils/localization_ext.dart';
import 'package:dristi/src/core/widgets/primary_snackbar.dart';
import 'package:dristi/src/features/on_boarding/presentation/riverpod/on_boarding_providers.dart';
import 'package:dristi/src/features/on_boarding/presentation/riverpod/on_boarding_state.dart';
import 'package:dristi/src/features/on_boarding/presentation/widgets/image_view_builder.dart';
import 'package:dristi/src/features/on_boarding/presentation/widgets/page_indicator_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class OnBoardingScreen extends ConsumerStatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  ConsumerState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState
    extends BaseConsumerStatefulWidget<OnBoardingScreen> {
  @override
  void initState() {
    super.initState();
    Future(() {
      onBoardingStatus();
    });
  }

  void onBoardingStatus() async {
    bool isFirstTime =
        await ref.read(onBoardingProvider.notifier).getFirstTimeStatus();

    if (!isFirstTime) {
      navigateToHomePage();
    } else {
      ref.read(onBoardingProvider.notifier).getOnBoardingComponents();
    }
  }

  @override
  Widget build(BuildContext context) {
    final onBoardingItems = ref.watch(onBoardingProvider);

    ref.listen(
      onBoardingProvider,
      (_, next) {
        if (next.status == OnBoardingStatus.success) {
          navigateToHomePage();
        } else if (next.status == OnBoardingStatus.failure) {
          ShowSnackBarMessage.showErrorSnackBar(
            message: next.errorMessage!,
            context: context,
          );
        }
      },
    );

    return Scaffold(
      body: onBoardingItems.data != null
          ? Stack(
              children: [
                const ImageViewBuilder(),
                const PageIndicatorBuilder(),
                _buildButton(),
                _buildTopName(),
              ],
            )
          : const SizedBox.shrink(),
    );
  }

  Widget _buildButton() {
    final notifier = ref.read(onBoardingProvider.notifier);

    return Positioned(
      bottom: AppValues.dimen_40.h,
      left: AppValues.dimen_0.w,
      right: AppValues.dimen_0.w,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppValues.dimen_28.w),
        child: ElevatedButton(
          onPressed: notifier.homeScreenNavigationSubmit,
          child: Text(
            context.localization.getStarted,
            style: appTextStyles.tertiaryNovaSemiBold16,
          ),
        ),
      ),
    );
  }

  Widget _buildTopName() {
    return Padding(
      padding: EdgeInsets.only(
        top: AppValues.dimen_48.r,
        left: AppValues.dimen_28.r,
      ),
      child: Align(
        alignment: Alignment.topLeft,
        child: Text(
          context.localization.appName,
          style: appTextStyles.onImageNovaBold28,
        ),
      ),
    );
  }

  void navigateToHomePage() {
    context.pushReplacementNamed(AppRoutes.home);
  }
}
