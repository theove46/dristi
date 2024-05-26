import 'package:dristi/src/core/base/base_stateful_widget.dart';
import 'package:dristi/src/core/constants/app_assets.dart';
import 'package:dristi/src/core/constants/app_values.dart';
import 'package:dristi/src/core/utils/asset_image_view.dart';
import 'package:dristi/src/core/utils/localization_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ErrorScreen extends StatefulWidget {
  final String? errorMessage;
  final VoidCallback? onPressed;

  const ErrorScreen({
    Key? key,
    this.errorMessage,
    this.onPressed,
  }) : super(key: key);

  @override
  State<ErrorScreen> createState() => _ErrorScreenState();
}

class _ErrorScreenState extends BaseStatefulWidget<ErrorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              style: appTextStyles.errorNovaBold16,
            ),
            SizedBox(height: AppValues.dimen_10.h),
            Text(
              widget.errorMessage ?? '',
              style: appTextStyles.primaryNovaSemiBold16,
            ),
            SizedBox(height: AppValues.dimen_30.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppValues.dimen_28.w),
              child: ElevatedButton(
                onPressed: widget.onPressed,
                child: Text(
                  context.localization.goBack,
                  style: appTextStyles.tertiaryNovaSemiBold16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
