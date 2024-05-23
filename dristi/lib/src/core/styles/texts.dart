import 'package:dristi/src/core/styles/app_ui_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FontFamily {
  static const String nova = 'Nova';
  static const String vibes = 'Vibes';
}

class AppTextStyles {
  final BuildContext context;
  AppTextStyles(this.context);

  /// Font Weights
  final TextStyle _regular = const TextStyle(fontWeight: FontWeight.w400);
  final TextStyle _medium = const TextStyle(fontWeight: FontWeight.w500);
  final TextStyle _semiBold = const TextStyle(fontWeight: FontWeight.w600);
  final TextStyle _bold = const TextStyle(fontWeight: FontWeight.w700);

  /// Font Families
  TextStyle get _novaRegular => _regular.copyWith(fontFamily: FontFamily.nova);
  TextStyle get _novaMedium => _medium.copyWith(fontFamily: FontFamily.nova);
  TextStyle get _novaSemiBold =>
      _semiBold.copyWith(fontFamily: FontFamily.nova);
  TextStyle get _novaBold => _bold.copyWith(fontFamily: FontFamily.nova);
  TextStyle get _vibesBold => _bold.copyWith(fontFamily: FontFamily.vibes);

  /// Font Colors
  TextStyle get primaryNovaRegular => _novaRegular.copyWith(
        color: AppUIColors.primaryTextColor(context),
      );
  TextStyle get primaryNovaMedium => _novaMedium.copyWith(
        color: AppUIColors.primaryTextColor(context),
      );
  TextStyle get primaryNovaSemiBold => _novaSemiBold.copyWith(
        color: AppUIColors.primaryTextColor(context),
      );
  TextStyle get primaryNovaBold => _novaBold.copyWith(
        color: AppUIColors.primaryTextColor(context),
      );
  TextStyle get secondaryNovaRegular => _novaRegular.copyWith(
        color: AppUIColors.secondaryTextColor(context),
      );
  TextStyle get secondaryNovaSemiBold => _novaSemiBold.copyWith(
        color: AppUIColors.secondaryTextColor(context),
      );
  TextStyle get secondaryNovaBold => _novaBold.copyWith(
        color: AppUIColors.secondaryTextColor(context),
      );
  TextStyle get tertiaryNovaRegular => _novaRegular.copyWith(
        color: AppUIColors.tertiaryTextColor(context),
      );
  TextStyle get tertiaryNovaSemiBold => _novaSemiBold.copyWith(
        color: AppUIColors.tertiaryTextColor(context),
      );
  TextStyle get errorNovaSemiBold => _novaSemiBold.copyWith(
        color: AppUIColors.errorTextColor(context),
      );
  TextStyle get tertiaryNovaBold => _novaBold.copyWith(
        color: AppUIColors.tertiaryTextColor(context),
      );
  TextStyle get errorNovaBold => _novaBold.copyWith(
        color: AppUIColors.errorTextColor(context),
      );
  TextStyle get tertiaryVibesBold => _vibesBold.copyWith(
        color: AppUIColors.tertiaryTextColor(context),
      );
  TextStyle get tertiaryVibesBoldShadow => tertiaryVibesBold.copyWith(
        shadows: [
          Shadow(
            offset: const Offset(3.0, 3.0),
            blurRadius: 2.0,
            color: AppUIColors.primaryTextColor(context),
          ),
        ],
      );

  /// Font Sizes
  TextStyle get primaryNovaRegular10 =>
      primaryNovaRegular.copyWith(fontSize: 10.sp);

  TextStyle get tertiaryNovaRegular10 =>
      tertiaryNovaRegular.copyWith(fontSize: 10.sp);

  TextStyle get secondaryNovaSemiBold10 =>
      secondaryNovaSemiBold.copyWith(fontSize: 10.sp);

  TextStyle get secondaryNovaRegular12 =>
      secondaryNovaRegular.copyWith(fontSize: 12.sp);

  TextStyle get primaryNovaBold12 => primaryNovaBold.copyWith(fontSize: 12.sp);

  TextStyle get secondaryNovaBold12 =>
      secondaryNovaBold.copyWith(fontSize: 12.sp);

  TextStyle get secondaryNovaRegular14 =>
      secondaryNovaRegular.copyWith(fontSize: 14.sp);

  TextStyle get secondaryNovaRegular16 =>
      secondaryNovaRegular.copyWith(fontSize: 16.sp);

  TextStyle get primaryNovaSemiBold16 =>
      primaryNovaSemiBold.copyWith(fontSize: 16.sp);

  TextStyle get tertiaryNovaSemiBold16 =>
      tertiaryNovaSemiBold.copyWith(fontSize: 16.sp);

  TextStyle get primaryNovaBold16 => primaryNovaBold.copyWith(fontSize: 16.sp);

  TextStyle get primaryNovaBold18 => primaryNovaBold.copyWith(fontSize: 18.sp);

  TextStyle get primaryNovaMedium24 =>
      primaryNovaMedium.copyWith(fontSize: 24.sp);

  TextStyle get primaryNovaBold28 => primaryNovaBold.copyWith(fontSize: 28.sp);

  TextStyle get tertiaryNovaBold28 =>
      tertiaryNovaBold.copyWith(fontSize: 28.sp);

  TextStyle get errorNovaBold24 => errorNovaBold.copyWith(fontSize: 24.sp);

  TextStyle get tertiaryVibesBoldShadow32 =>
      tertiaryVibesBoldShadow.copyWith(fontSize: 32.sp);

  TextStyle get tertiaryVibesBoldShadow44 =>
      tertiaryVibesBoldShadow.copyWith(fontSize: 44.sp);

  TextStyle get tertiaryVibesBoldShadow60 =>
      tertiaryVibesBoldShadow.copyWith(fontSize: 60.sp);
}
