import 'package:dristi/src/core/constants/app_assets.dart';
import 'package:dristi/src/core/constants/app_values.dart';
import 'package:dristi/src/core/styles/colors.dart';
import 'package:dristi/src/core/styles/texts.dart';
import 'package:dristi/src/core/utils/asset_image_view.dart';
import 'package:dristi/src/core/utils/localization_ext.dart';
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
              height: AppValues.dimen_200.r,
              width: AppValues.dimen_200.r,
            ),
            Text(
              context.localization.somethingWentWrong,
              style: AppTextStyles(context).errorNovaBold24,
            ),
            SizedBox(height: AppValues.dimen_10.h),
            Text(
              errorMessage,
              style: AppTextStyles(context).primaryNovaSemiBold16,
            ),
            SizedBox(height: AppValues.dimen_30.h),
            ElevatedButton(
              onPressed: onPressed,
              child: Text(
                context.localization.goBack,
                style: AppTextStyles(context).tertiaryNovaSemiBold16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
