import 'package:dristi/src/core/theme/colors.dart';
import 'package:dristi/src/core/theme/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTypography {
  static TextStyle _getTextStyle(
    double fontSize,
    String fontFamily,
    FontWeight fontWeight,
    Color color,
  ) {
    return TextStyle(
      fontSize: fontSize,
      fontFamily: fontFamily,
      fontWeight: fontWeight,
      color: color,
    );
  }

  static TextStyle _getTextStyleWithShadow(
    double fontSize,
    String fontFamily,
    FontWeight fontWeight,
    Color color,
  ) {
    return TextStyle(
      fontSize: fontSize,
      fontFamily: fontFamily,
      fontWeight: fontWeight,
      color: color,
      shadows: const [
        Shadow(
          offset: Offset(3.0, 3.0),
          blurRadius: 2.0,
          color: UIColors.primary,
        ),
      ],
    );
  }

  static TextStyle regular12Nova({Color? color}) {
    return _getTextStyle(
      FontSize.s12.sp,
      FontConstants.fontFamilyNova,
      FontWeightManager.regular,
      color ?? UIColors.black,
    );
  }

  static TextStyle bold12Nova({Color? color}) {
    return _getTextStyle(
      FontSize.s12.sp,
      FontConstants.fontFamilyNova,
      FontWeightManager.bold,
      color ?? UIColors.black,
    );
  }

  static TextStyle regular14Nova({Color? color}) {
    return _getTextStyle(
      FontSize.s14.sp,
      FontConstants.fontFamilyNova,
      FontWeightManager.regular,
      color ?? UIColors.black,
    );
  }

  static TextStyle semiBold14Nova({Color? color}) {
    return _getTextStyle(
      FontSize.s14.sp,
      FontConstants.fontFamilyNova,
      FontWeightManager.semiBold,
      color ?? UIColors.black,
    );
  }

  static TextStyle bold14Caros({Color? color}) {
    return _getTextStyle(
      FontSize.s14.sp,
      FontConstants.fontFamilyNova,
      FontWeightManager.bold,
      color ?? UIColors.black,
    );
  }

  static TextStyle regular16Nova({Color? color}) {
    return _getTextStyle(
      FontSize.s16.sp,
      FontConstants.fontFamilyNova,
      FontWeightManager.regular,
      color ?? UIColors.black,
    );
  }

  static TextStyle semiBold16Nova({Color? color}) {
    return _getTextStyle(
      FontSize.s16.sp,
      FontConstants.fontFamilyNova,
      FontWeightManager.semiBold,
      color ?? UIColors.black,
    );
  }

  static TextStyle bold16Nova({Color? color}) {
    return _getTextStyle(
      FontSize.s16.sp,
      FontConstants.fontFamilyNova,
      FontWeightManager.bold,
      color ?? UIColors.black,
    );
  }

  static TextStyle bold18Nova({Color? color}) {
    return _getTextStyle(
      FontSize.s18.sp,
      FontConstants.fontFamilyNova,
      FontWeightManager.bold,
      color ?? UIColors.black,
    );
  }

  static TextStyle bold20Nova({Color? color}) {
    return _getTextStyle(
      FontSize.s20.sp,
      FontConstants.fontFamilyNova,
      FontWeightManager.bold,
      color ?? UIColors.black,
    );
  }

  static TextStyle bold24Nova({Color? color}) {
    return _getTextStyle(
      FontSize.s24.sp,
      FontConstants.fontFamilyNova,
      FontWeightManager.bold,
      color ?? UIColors.black,
    );
  }

  static TextStyle bold32Nova({Color? color}) {
    return _getTextStyle(
      FontSize.s32.sp,
      FontConstants.fontFamilyNova,
      FontWeightManager.bold,
      color ?? UIColors.black,
    );
  }

  static TextStyle bold32Vibes({Color? color}) {
    return _getTextStyle(
      FontSize.s32.sp,
      FontConstants.fontFamilyVibes,
      FontWeightManager.bold,
      color ?? UIColors.black,
    );
  }

  static TextStyle bold60VibesWithShadow({Color? color}) {
    return _getTextStyleWithShadow(
      FontSize.s60.sp,
      FontConstants.fontFamilyVibes,
      FontWeightManager.bold,
      color ?? UIColors.black,
    );
  }
}
