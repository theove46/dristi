import 'package:dristi/src/core/styles/texts.dart';
import 'package:dristi/src/core/styles/themes/icon_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBarTheme extends AppBarTheme {
  final ColorScheme scheme;

  CustomAppBarTheme({
    required this.scheme,
  }) : super(
          backgroundColor: scheme.surface,
          foregroundColor: scheme.primary,
          surfaceTintColor: scheme.surfaceTint,
          elevation: 0,
          titleSpacing: 0,
          centerTitle: false,
          titleTextStyle: TextStyle(
            color: scheme.primary,
            fontWeight: FontWeight.w700,
            fontFamily: FontFamily.nova,
            fontSize: 16.sp,
          ),
          iconTheme: CustomIconTheme(
            scheme: scheme,
          ),
        );
}
