import 'package:flutter/material.dart';

// Color instruction:
// primary, secondary, tertiary, error: Variations of Components Color
// onPrimary, onSecondary, onTertiary, onError: Variations of texts
// background: Scaffold Background Color -> Mainly Secondary Color
// onBackground: Always White Color -> Components On Image Color
// outline: Outline Color -> Mainly Primary Color
// shadow: Deep Color -> Primary for Light, Secondary for Dark
// surface: Lighter Variants for shadow Color
// surTint: Container background color, Appbar surfaceTintColor color

const lightColorScheme = ColorScheme(
  brightness: Brightness.light,

  // primary
  primary: Color(0xFF086972), // set
  onPrimary: Color(0xFF086972), // set
  primaryContainer: Color(0xFF000000),
  onPrimaryContainer: Color(0xFF6d6e70),

  // secondary
  secondary: Color(0xFFFFFFFF), // set
  onSecondary: Color(0xff333333), // set
  secondaryContainer: Color(0xFF000000),
  onSecondaryContainer: Color(0xFF000000),

  // tertiary
  tertiary: Color(0xFF17b978), // set
  onTertiary: Color(0xFFFFFFFF), // set
  tertiaryContainer: Color(0xFFE6CDD5),
  onTertiaryContainer: Color(0xFF332227),

  // error
  error: Color(0xffEA5455), // set
  onError: Color(0xffEA5455), // set
  errorContainer: Color(0xFFE6ACA6),
  onErrorContainer: Color(0xFF000000),

  // background
  background: Color(0xFFFFFFFF), // set
  onBackground: Color(0xFFFFFFFF), // set

  // surface
  surface: Color(0xFF49beb7), // set
  onSurface: Color(0xFF000000),
  surfaceVariant: Color(0xFF000000),
  onSurfaceVariant: Color(0xFF000000),
  surfaceTint: Color(0xFFdaeaf6), // set

  // outline
  outline: Color(0xFF086972), // set

  // shadow
  shadow: Color(0xFF086972), // set
);

const darkColorScheme = ColorScheme(
  brightness: Brightness.dark,

  // primary
  primary: Color(0xFF17b978), // set
  onPrimary: Color(0xFF17b978), // set
  primaryContainer: Color(0xFF000000),
  onPrimaryContainer: Color(0xFFB3E6DF),

  // secondary
  secondary: Color(0xFF001f3f), // set
  onSecondary: Color(0xFFdaeaf6), // set
  secondaryContainer: Color(0xFF000000),
  onSecondaryContainer: Color(0xFF000000),

  // tertiary
  tertiary: Color(0xFFfacf5a), // set
  onTertiary: Color(0xFF001f3f), // set
  tertiaryContainer: Color(0xFF000000),
  onTertiaryContainer: Color(0xFF000000),

  // error
  error: Color(0xFFE69490), // set
  onError: Color(0xffff304f), // set
  errorContainer: Color(0xFF000000),
  onErrorContainer: Color(0xFF000000),

  // background
  background: Color(0xFF001f3f), // set
  onBackground: Color(0xFFdaeaf6), // set

  // surface
  surface: Color(0xFF1f4287), // set
  onSurface: Color(0xFF000000),
  surfaceVariant: Color(0xFF000000),
  onSurfaceVariant: Color(0xFF000000),
  surfaceTint: Color(0xFF88bef5), // set

  // outline
  outline: Color(0xFFdaeaf6), // set

  // shadow
  shadow: Color(0xFF001f3f), // set
);
