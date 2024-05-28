import 'package:flutter/material.dart';

class UIColors {
  final BuildContext context;
  UIColors(this.context);

  Color transparent = Colors.transparent;

  Color get primary => Theme.of(context).colorScheme.primary;

  Color get secondary => Theme.of(context).colorScheme.secondary;

  Color get tertiary => Theme.of(context).colorScheme.tertiary;

  Color get error => Theme.of(context).colorScheme.error;

  Color get shadow => Theme.of(context).colorScheme.shadow;

  Color get background => Theme.of(context).colorScheme.surface;

  Color get onImage => Theme.of(context).colorScheme.onSurface;

  // Text Colors
  static Color primaryText(BuildContext context) =>
      Theme.of(context).colorScheme.onPrimary;

  static Color secondaryText(BuildContext context) =>
      Theme.of(context).colorScheme.onSecondary;

  static Color tertiaryText(BuildContext context) =>
      Theme.of(context).colorScheme.onTertiary;

  static Color errorText(BuildContext context) =>
      Theme.of(context).colorScheme.onError;

  static Color onImageText(BuildContext context) =>
      Theme.of(context).colorScheme.onSurface;

  static Color onImageShadowText(BuildContext context) =>
      Theme.of(context).colorScheme.shadow;

  // Component Colors
  static Color componentsPrimary(BuildContext context) =>
      Theme.of(context).colorScheme.primary;

  static Color componentsWhite(BuildContext context) =>
      Theme.of(context).colorScheme.onSurface;

  static Color componentsError(BuildContext context) =>
      Theme.of(context).colorScheme.error;

  static List<Color> shimmerGradient(BuildContext context) => [
        Theme.of(context).colorScheme.inverseSurface,
        Theme.of(context).colorScheme.onInverseSurface,
        Theme.of(context).colorScheme.inverseSurface,
      ];
}
