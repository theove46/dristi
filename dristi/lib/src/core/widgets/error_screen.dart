import 'package:dristi/src/core/assets/assets.dart';
import 'package:dristi/src/core/constants/app_values.dart';
import 'package:dristi/src/core/theme/colors.dart';
import 'package:dristi/src/core/theme/text_styles.dart';
import 'package:dristi/src/core/utils/asset_image_view.dart';
import 'package:dristi/src/core/utils/localization_ext.dart';
import 'package:dristi/src/core/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ErrorScreen extends StatelessWidget {
  final String errorMessage;
  final VoidCallback onPressed;

  const ErrorScreen({
    Key? key,
    required this.errorMessage,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UIColors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AssetImageView(
              fileName: Assets.error,
              height: AppValues.dimen_200.h,
              width: AppValues.dimen_200.h,
            ),
            Text(
              context.localization.somethingWentWrong,
              style: redNovaBold24,
            ),
            SizedBox(height: AppValues.dimen_10.h),
            Text(
              errorMessage,
              style: primaryNovaSemiBold16,
            ),
            SizedBox(height: AppValues.dimen_30.h),
            Button(
              label: context.localization.goBack,
              textStyle: whiteNovaSemiBold16,
              width: AppValues.dimen_360.w,
              onPressed: onPressed,
            )
          ],
        ),
      ),
    );
  }
}
