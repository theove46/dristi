import 'package:dristi/src/core/theme/colors.dart';
import 'package:dristi/src/core/theme/font_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Button extends StatelessWidget {
  const Button({
    required this.label,
    required this.onPressed,
    super.key,
    this.background,
    this.textStyle,
    this.scale = 1,
    this.height = 48,
    this.width = double.infinity,
    this.isLoading = false,
    this.filled = true,
    this.prefix,
    this.disable = false,
    this.isBackButton = false,
  });

  factory Button.filled({
    required String label,
    required VoidCallback onPressed,
    Color? background,
    TextStyle? textStyle,
    double scale = 1,
    double height = 48,
    double width = double.infinity,
    bool isLoading = false,
    Widget? prefix,
    bool disable = false,
  }) {
    return Button(
      label: label,
      onPressed: onPressed,
      background: background,
      textStyle: textStyle,
      scale: scale,
      height: height,
      width: width,
      isLoading: isLoading,
      prefix: prefix,
      disable: disable,
    );
  }

  factory Button.outlined({
    required String label,
    required VoidCallback onPressed,
    Color? background,
    TextStyle? textStyle,
    double scale = 1,
    double height = 48,
    double width = double.infinity,
    bool isLoading = false,
    Widget? prefix,
    bool disable = false,
  }) {
    return Button(
      label: label,
      onPressed: onPressed,
      background: background,
      textStyle: textStyle,
      scale: scale,
      height: height,
      width: width,
      isLoading: isLoading,
      filled: false,
      prefix: prefix,
      disable: disable,
    );
  }

  factory Button.back({VoidCallback? onPressed}) {
    return Button(label: '', onPressed: onPressed ?? () {}, isBackButton: true);
  }

  final VoidCallback onPressed;
  final String label;
  final Color? background;
  final TextStyle? textStyle;
  final double scale;
  final double height;
  final double width;
  final bool filled;
  final bool isLoading;
  final Widget? prefix;
  final bool disable;
  final bool isBackButton;

  @override
  Widget build(BuildContext context) {
    final height = this.height;
    const borderRadius = 16.0;

    return isBackButton
        ? GestureDetector(
            onTap: () {
              onPressed();
              Navigator.pop(context);
            },
            child: SizedBox(
              width: 24.sp,
              height: 24.sp,
              child: const Icon(Icons.arrow_back_ios),
            ),
          )
        : ElevatedButton(
            onPressed: disable
                ? null
                : isLoading
                    ? null
                    : onPressed,
            style: filled
                ? ElevatedButton.styleFrom(
                    elevation: 0,
                    fixedSize: Size(width, height),
                    backgroundColor: background ?? UIColors.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(borderRadius),
                    ),
                  )
                : ElevatedButton.styleFrom(
                    elevation: 0,
                    fixedSize: Size(width, height),
                    backgroundColor: disable
                        ? UIColors.gray
                        : background ?? UIColors.transparent,
                    side: BorderSide(
                      color:
                          isLoading ? UIColors.transparent : UIColors.primary,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(borderRadius),
                    ),
                  ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (isLoading)
                  Transform.scale(
                    scale: scale,
                    child: const SizedBox(
                      height: 30,
                      width: 30,
                      child: CircularProgressIndicator(
                        color: UIColors.primary,
                      ),
                    ),
                  )
                else
                  prefix == null
                      ? Text(
                          label,
                          style: textStyle ?? _labelTextStyle(context),
                        )
                      : Row(
                          children: [
                            prefix!,
                            SizedBox(width: 10.w),
                            Text(
                              label,
                              style: textStyle ?? _labelTextStyle(context),
                            ),
                          ],
                        ),
              ],
            ),
          );
  }

  TextStyle _labelTextStyle(BuildContext context) {
    return AppTypography.regular16Nova();
  }
}
