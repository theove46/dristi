import 'package:dristi/src/core/services/routes/app_routes.dart';
import 'package:dristi/src/core/services/routes/navigation_helper.dart';
import 'package:dristi/src/core/utils/localization_ext.dart';
import 'package:dristi/src/core/widgets/error_screen.dart';
import 'package:dristi/src/features/destinations/presentation/pages/destinations_list_page.dart';
import 'package:dristi/src/features/districts/presentation/pages/districts_list_page.dart';
import 'package:dristi/src/features/home/home_page/pages/home_page.dart';
import 'package:dristi/src/features/splash/presentation/pages/splash_page.dart';
import 'package:dristi/src/features/spot/presentation/pages/spot_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

abstract class _Path {
  static const String home = '/home';
  static const String splash = '/splash';
  static const String spot = '/spot';
  static const String districts = '/districts';
  static const String destination = '/destination';
}

GoRouter appRouter(bool isFirstTime) {
  return GoRouter(
    navigatorKey: NavigationHelper().parentNavigatorKey,
    initialLocation: isFirstTime ? _Path.splash : _Path.home,
    observers: [
      RouteNavigatorObserver(),
    ],
    routes: <RouteBase>[
      GoRoute(
        path: _Path.home,
        name: AppRoutes.home,
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: _Path.splash,
        name: AppRoutes.splash,
        builder: (context, state) => const SplashPage(),
      ),
      GoRoute(
        path: _Path.spot,
        name: AppRoutes.spot,
        builder: (context, state) => const SpotPage(),
      ),
      GoRoute(
        path: _Path.districts,
        name: AppRoutes.districts,
        builder: (context, state) => const DistrictsPage(),
      ),
      GoRoute(
        path: _Path.destination,
        name: AppRoutes.destination,
        builder: (context, state) => const DestinationPage(),
      ),
    ],
    errorPageBuilder: (context, state) {
      return MaterialPage<void>(
        key: state.pageKey,
        child: ErrorScreen(
          errorMessage: context.localization.pageNotFound,
          onPressed: () {
            context.pop();
          },
        ),
      );
    },
  );
}