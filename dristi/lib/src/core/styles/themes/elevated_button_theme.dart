import 'package:dristi/src/core/constants/app_values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomElevatedButtonTheme extends ButtonStyle {
  final ColorScheme scheme;

  CustomElevatedButtonTheme({required this.scheme})
      : super(
          backgroundColor: MaterialStateProperty.resolveWith(
            (states) {
              if (states.contains(MaterialState.disabled) ||
                  states.contains(MaterialState.selected)) {
                return scheme.surface;
              } else {
                return scheme.primary;
              }
            },
          ),
          foregroundColor: MaterialStateProperty.resolveWith(
            (states) {
              if (states.contains(MaterialState.disabled)) {
                return scheme.shadow;
              } else {
                return scheme.primary;
              }
            },
          ),
          overlayColor: MaterialStateProperty.resolveWith(
            (states) {
              if (states.contains(MaterialState.disabled) ||
                  states.contains(MaterialState.selected)) {
                return scheme.shadow;
              } else {
                return scheme.surface;
              }
            },
          ),
          animationDuration: const Duration(milliseconds: 100),
          minimumSize: MaterialStatePropertyAll(
            Size(
              double.infinity,
              AppValues.dimen_48.r,
            ),
          ),
          padding: MaterialStatePropertyAll(
            EdgeInsets.symmetric(
              vertical: AppValues.dimen_16.r,
              horizontal: AppValues.dimen_16.r,
            ),
          ),
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                AppValues.dimen_16.r,
              ),
            ),
          ),
        );
}
