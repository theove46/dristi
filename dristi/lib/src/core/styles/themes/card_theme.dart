import 'package:dristi/src/core/constants/app_values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCardTheme extends CardTheme {
  final ColorScheme scheme;

  CustomCardTheme({
    required this.scheme,
  }) : super(
          elevation: 4,
          color: scheme.secondary,
          margin: EdgeInsets.all(AppValues.dimen_8.r),
          shadowColor: scheme.shadow,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppValues.dimen_16.r),
          ),
        );
}
