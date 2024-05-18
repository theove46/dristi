import 'package:flutter/material.dart';

class NavigationHelper {
  NavigationHelper._internal();

  static final NavigationHelper _instance = NavigationHelper._internal();

  factory NavigationHelper() => _instance;

  final GlobalKey<NavigatorState> parentNavigatorKey =
      GlobalKey<NavigatorState>();
}
