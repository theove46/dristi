import 'package:dristi/src/core/loggers/logger.dart';
import 'package:flutter/material.dart';

class NavigationHelper {
  NavigationHelper._internal();

  static final NavigationHelper _instance = NavigationHelper._internal();

  factory NavigationHelper() => _instance;

  final GlobalKey<NavigatorState> parentNavigatorKey =
      GlobalKey<NavigatorState>();
}

class RouteNavigatorObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    _logRoute(route, 'DidPush');
    super.didPush(route, previousRoute);
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    _logRoute(route, 'DidPop');
    super.didPop(route, previousRoute);
  }

  void _logRoute(Route<dynamic> route, String action) {
    final String? routeName = route.settings.name;
    Log.info('$action route: ${routeName ?? 'unknown'}');
  }
}
