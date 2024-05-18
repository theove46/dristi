import 'package:dristi/src/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FontFamily {
  static const String nova = 'Nova';
  static const String vibes = 'Vibes';
}

/// Font Weights
const TextStyle _regular = TextStyle(fontWeight: FontWeight.w400);
const TextStyle _medium = TextStyle(fontWeight: FontWeight.w500);
const TextStyle _semiBold = TextStyle(fontWeight: FontWeight.w600);
const TextStyle _bold = TextStyle(fontWeight: FontWeight.w700);

/// Font Families
final TextStyle _novaRegular = _regular.copyWith(fontFamily: FontFamily.nova);
final TextStyle _novaMedium = _medium.copyWith(fontFamily: FontFamily.nova);
final TextStyle _novaSemiBold = _semiBold.copyWith(fontFamily: FontFamily.nova);
final TextStyle _novaBold = _bold.copyWith(fontFamily: FontFamily.nova);

final TextStyle _vibesBold = _bold.copyWith(fontFamily: FontFamily.vibes);

/// Font Colors
final TextStyle _primaryNovaRegular = _novaRegular.copyWith(
  color: UIColors.primary,
);
final TextStyle _primaryNovaMedium = _novaMedium.copyWith(
  color: UIColors.primary,
);
final TextStyle _primaryNovaSemiBold = _novaSemiBold.copyWith(
  color: UIColors.primary,
);
final TextStyle _primaryNovaBold = _novaBold.copyWith(
  color: UIColors.primary,
);

final TextStyle _blackNovaRegular = _novaRegular.copyWith(
  color: UIColors.black,
);
final TextStyle _blackNovaSemiBold = _novaSemiBold.copyWith(
  color: UIColors.black,
);
final TextStyle _blackNovaBold = _novaBold.copyWith(
  color: UIColors.black,
);

final TextStyle _whiteNovaRegular = _novaRegular.copyWith(
  color: UIColors.white,
);

final TextStyle _whiteNovaSemiBold = _novaSemiBold.copyWith(
  color: UIColors.white,
);

final TextStyle _redNovaSemiBold = _novaSemiBold.copyWith(
  color: UIColors.red,
);

final TextStyle _whiteNovaBold = _novaBold.copyWith(
  color: UIColors.white,
);

final TextStyle _redNovaBold = _novaBold.copyWith(
  color: UIColors.red,
);

final TextStyle _whiteVibesBold = _vibesBold.copyWith(
  color: UIColors.white,
);

/// Font Shadow
final TextStyle _whiteVibesBoldShadow = _whiteVibesBold.copyWith(
  shadows: const [
    Shadow(
      offset: Offset(3.0, 3.0),
      blurRadius: 2.0,
      color: UIColors.primary,
    ),
  ],
);

/// Font Sizes
final TextStyle primaryNovaRegular10 = _primaryNovaRegular.copyWith(
  fontSize: 10.sp,
);
final TextStyle whiteNovaRegular10 = _whiteNovaRegular.copyWith(
  fontSize: 10.sp,
);
final TextStyle blackNovaSemiBold10 = _blackNovaSemiBold.copyWith(
  fontSize: 10.sp,
);
final TextStyle blackNovaRegular12 = _blackNovaRegular.copyWith(
  fontSize: 12.sp,
);
final TextStyle primaryNovaBold12 = _primaryNovaBold.copyWith(
  fontSize: 12.sp,
);
final TextStyle blackNovaBold12 = _blackNovaBold.copyWith(
  fontSize: 12.sp,
);
final TextStyle blackNovaRegular14 = _blackNovaRegular.copyWith(
  fontSize: 14.sp,
);
final TextStyle blackNovaRegular16 = _blackNovaRegular.copyWith(
  fontSize: 16.sp,
);
final TextStyle primaryNovaSemiBold16 = _primaryNovaSemiBold.copyWith(
  fontSize: 16.sp,
);
final TextStyle whiteNovaSemiBold16 = _whiteNovaSemiBold.copyWith(
  fontSize: 16.sp,
);
final TextStyle redNovaSemiBold16 = _redNovaSemiBold.copyWith(
  fontSize: 16.sp,
);
final TextStyle primaryNovaBold16 = _primaryNovaBold.copyWith(
  fontSize: 16.sp,
);
final TextStyle primaryNovaBold18 = _primaryNovaBold.copyWith(
  fontSize: 18.sp,
);
final TextStyle blackNovaBold18 = _blackNovaBold.copyWith(
  fontSize: 18.sp,
);
final TextStyle whiteNovaBold20 = _whiteNovaBold.copyWith(
  fontSize: 20.sp,
);
final TextStyle primaryNovaMedium24 = _primaryNovaMedium.copyWith(
  fontSize: 24.sp,
);
final TextStyle primaryNovaBold28 = _primaryNovaBold.copyWith(
  fontSize: 28.sp,
);
final TextStyle whiteNovaBold28 = _whiteNovaBold.copyWith(
  fontSize: 28.sp,
);
final TextStyle redNovaBold24 = _redNovaBold.copyWith(
  fontSize: 24.sp,
);
final TextStyle whiteVibesBoldShadow32 = _whiteVibesBoldShadow.copyWith(
  fontSize: 32.sp,
);
final TextStyle whiteVibesBoldShadow44 = _whiteVibesBoldShadow.copyWith(
  fontSize: 44.sp,
);
final TextStyle whiteVibesBoldShadow60 = _whiteVibesBoldShadow.copyWith(
  fontSize: 60.sp,
);
