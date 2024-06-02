import 'package:dristi/src/core/constants/app_values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomInputDecorationTheme extends InputDecorationTheme {
  final ColorScheme scheme;

  CustomInputDecorationTheme({required this.scheme})
      : super(
          isDense: true,
          contentPadding: EdgeInsets.symmetric(
            vertical: AppValues.dimen_16.r,
            horizontal: AppValues.dimen_16.r,
          ),
          errorStyle: TextStyle(
            fontSize: 12,
            letterSpacing: 0.1,
            fontWeight: FontWeight.w500,
            color: scheme.error,
          ),
          labelStyle: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.1,
            color: scheme.primary,
          ),
          hintStyle: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.1,
            color: scheme.onPrimaryContainer,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: scheme.primary,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: scheme.primary,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: scheme.primary,
            ),
          ),
          suffixIconColor: scheme.primary,
        );
}
