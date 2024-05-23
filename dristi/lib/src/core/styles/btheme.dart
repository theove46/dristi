import 'package:flutter/material.dart';

enum ThemeType {
  light,
  dark,
}

class AppTheme {
  static ThemeType defaultTheme = ThemeType.light;

  Color backGroundColorMain;
  Color titleText;
  Color primaryColor;
  Color btnColor;
  Color btnPrimaryColor;
  Color textFieldPrefixIconColor;
  Color lightText;
  Color searchBackground;
  Color backGroundColor;
  Color linkErrorColor;
  Color whiteColor;
  Color transparentColor;
  Color txtTransparentColor;
  Color txtColor;
  Color subtextColor;
  Color shadowWhiteColor;
  Color colorDivider;
  Color textColor;
  Color colorContainer;
  Color yellowColor;
  Color containerZone;
  Color colorText;
  Color iconColor;
  Color highLight;
  Color highLightRed;
  Color shadowColor;
  Color shadowColorTwo;
  Color shadowColorThree;
  Color shadowColorFour;
  Color shadowColorFive;
  Color shadowColorSix;
  Color textFieldBackgroundColor;
  Color regularTextColor;

  AppTheme({
    required this.backGroundColorMain,
    required this.primaryColor,
    required this.btnColor,
    required this.btnPrimaryColor,
    required this.textFieldPrefixIconColor,
    required this.lightText,
    required this.searchBackground,
    required this.backGroundColor,
    required this.linkErrorColor,
    required this.whiteColor,
    required this.containerZone,
    required this.transparentColor,
    required this.txtTransparentColor,
    required this.highLight,
    required this.highLightRed,
    required this.yellowColor,
    required this.colorText,
    required this.colorContainer,
    required this.iconColor,
    required this.subtextColor,
    required this.shadowWhiteColor,
    required this.colorDivider,
    required this.textColor,
    required this.txtColor,
    required this.shadowColor,
    required this.shadowColorTwo,
    required this.shadowColorThree,
    required this.shadowColorFour,
    required this.shadowColorFive,
    required this.shadowColorSix,
    required this.titleText,
    required this.textFieldBackgroundColor,
    required this.regularTextColor,
  });

  factory AppTheme.fromType(ThemeType t) {
    switch (t) {
      case ThemeType.light:
        return AppTheme(
          textFieldBackgroundColor: const Color(0xffF6F6F7),
          backGroundColorMain: const Color(0xffFFFFFF),
          primaryColor: const Color(0xFF662483),
          btnColor: const Color(0xFF662483),
          btnPrimaryColor: const Color(0xffFFFFFF),
          textFieldPrefixIconColor: const Color(0xFF662483),
          lightText: const Color(0xff9BA3AA),
          searchBackground: const Color(0xffF6F6F7),
          colorContainer: const Color(0xffFFFFFF),
          backGroundColor: const Color(0xff203342),
          linkErrorColor: const Color(0xffF04949),
          colorText: const Color(0xff051E47),
          whiteColor: const Color(0xffFFFFFF),
          highLight: const Color(0xff198754),
          highLightRed: const Color(0xffFF4C3B),
          transparentColor: const Color(0xff192D3C),
          containerZone: const Color(0xffF6F6F7),
          txtTransparentColor: const Color(0xffA5ADB3),
          txtColor: const Color(0xff203342),
          shadowWhiteColor: const Color(0x000fffff),
          colorDivider: const Color(0xffEDEFF4),
          textColor: const Color(0xff010D21),
          regularTextColor: const Color(0xff010D21),
          yellowColor: const Color(0xffFFBA00),
          iconColor: const Color(0xff292D32),
          subtextColor: const Color(0xffA0A8AF),
          titleText: const Color(0xFF662483),
          shadowColor: const Color.fromRGBO(0, 0, 0, 0.07),
          shadowColorTwo: const Color.fromRGBO(0, 0, 0, 0.13),
          shadowColorThree: const Color.fromRGBO(0, 0, 0, 0.04),
          shadowColorFour: const Color.fromRGBO(0, 0, 0, 0.03),
          shadowColorFive: const Color.fromRGBO(0, 0, 0, 0.10),
          shadowColorSix: const Color.fromRGBO(155, 163, 170, 0.25),
        );

      case ThemeType.dark:
        return AppTheme(
          textFieldBackgroundColor: const Color(0xff192D3C),
          backGroundColorMain: const Color(0xff07141F),
          primaryColor: const Color(0xff192D3C),
          btnColor: const Color(0xff192D3C),
          btnPrimaryColor: const Color(0xffFFFFFF),
          textFieldPrefixIconColor: const Color(0xffF6F6F7),
          lightText: const Color(0xffA5ADB3),
          searchBackground: const Color(0xff122636),
          backGroundColor: const Color(0xff203342),
          linkErrorColor: const Color(0xffF04949),
          whiteColor: const Color(0xffFFFFFF),
          colorContainer: const Color(0xff1F303E),
          highLightRed: const Color(0xffFF4C3B),
          colorText: const Color(0xff051E47),
          transparentColor: const Color(0xff192D3C),
          iconColor: const Color(0xff292D32),
          containerZone: const Color(0xff091D2D),
          txtTransparentColor: const Color(0xffEDEFF4),
          txtColor: const Color(0xff203342),
          regularTextColor: const Color(0xffFFFFFF),
          titleText: const Color(0xffFFFFFF),
          shadowWhiteColor: const Color(0x000fffff),
          colorDivider: const Color(0xffEDEFF4),
          yellowColor: const Color(0xffFFBA00),
          textColor: const Color(0xff010D21),
          highLight: const Color(0xff198754),
          subtextColor: const Color(0xffA0A8AF),
          shadowColor: const Color.fromRGBO(0, 0, 0, 0.07),
          shadowColorTwo: const Color.fromRGBO(0, 0, 0, 0.13),
          shadowColorThree: const Color.fromRGBO(0, 0, 0, 0.04),
          shadowColorFour: const Color.fromRGBO(0, 0, 0, 0.03),
          shadowColorFive: const Color.fromRGBO(0, 0, 0, 0.10),
          shadowColorSix: const Color.fromRGBO(155, 163, 170, 0.25),
        );
    }
  }

  ThemeData get themeData {
    var t = ThemeData.from(
      useMaterial3: true,
      colorScheme: ColorScheme(
        brightness: Brightness.dark,
        primary: primaryColor,
        secondary: btnPrimaryColor,
        background: searchBackground,
        surface: lightText,
        onBackground: backGroundColor,
        onSurface: primaryColor,
        onError: linkErrorColor,
        onPrimary: btnPrimaryColor,
        tertiary: whiteColor,
        onInverseSurface: whiteColor,
        tertiaryContainer: whiteColor,
        surfaceTint: whiteColor,
        surfaceVariant: whiteColor,
        onSecondary: btnPrimaryColor,
        error: linkErrorColor,
      ),
    );
    return t.copyWith(
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      textSelectionTheme: TextSelectionThemeData(
          selectionHandleColor: Colors.transparent, cursorColor: primaryColor),
      buttonTheme: ButtonThemeData(buttonColor: primaryColor),
      highlightColor: primaryColor,
    );
  }
}
