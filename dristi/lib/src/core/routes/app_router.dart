import 'package:dristi/src/core/global_widgets/error_screen.dart';
import 'package:dristi/src/core/global_widgets/web_view_screen.dart';
import 'package:dristi/src/core/routes/app_routes.dart';
import 'package:dristi/src/core/routes/navigation_helper.dart';
import 'package:dristi/src/core/utils/localization_ext.dart';
import 'package:dristi/src/features/destinations_list/presentation/pages/destinations_list_screen.dart';
import 'package:dristi/src/features/districts/presentation/pages/districts_list_screen.dart';
import 'package:dristi/src/features/home/advertisements/domain/entity/advertisement_entity.dart';
import 'package:dristi/src/features/home/home_screen/pages/home_screen.dart';
import 'package:dristi/src/features/hotels_list/presentation/pages/hotels_list_screen.dart';
import 'package:dristi/src/features/on_boarding/presentation/pages/on_boarding_screen.dart';
import 'package:dristi/src/features/settings/presentation/pages/settings_screen.dart';
import 'package:dristi/src/features/spot/presentation/pages/spot_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

abstract class _Path {
  static const String home = '/home';
  static const String splash = '/splash';
  static const String spot = '/spot/:spotId/:instanceId';
  static const String districts = '/districts';
  static const String destination = '/destination';
  static const String hotelsList = '/hotelsList';
  static const String settings = '/settings';
  static const String webView = '/webView';
  static const String error = '/error';
}

abstract class PathParameter {
  static const String spotId = 'spotId';
  static const String instanceId = 'instanceId';
}

GoRouter appRouter = GoRouter(
  navigatorKey: NavigationHelper().parentNavigatorKey,
  initialLocation: _Path.splash,
  observers: [RouteNavigatorObserver()],
  routes: <RouteBase>[
    GoRoute(
      path: _Path.splash,
      name: AppRoutes.splash,
      builder: (context, state) => const OnBoardingScreen(),
    ),
    GoRoute(
      path: _Path.home,
      name: AppRoutes.home,
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      name: AppRoutes.spot,
      path: _Path.spot,
      builder: (context, state) {
        final spotId = state.pathParameters[PathParameter.spotId]!;
        final instanceId = state.pathParameters[PathParameter.instanceId]!;
        return SpotScreen(
          id: spotId,
          instanceId: instanceId,
        );
      },
    ),
    GoRoute(
      path: _Path.districts,
      name: AppRoutes.districts,
      builder: (context, state) => const DistrictsScreen(),
    ),
    GoRoute(
      path: _Path.destination,
      name: AppRoutes.destination,
      builder: (context, state) {
        return const DestinationsListScreen();
      },
    ),
    GoRoute(
      path: _Path.hotelsList,
      name: AppRoutes.hotelsList,
      builder: (context, state) {
        return const HotelsListScreen();
      },
    ),
    GoRoute(
      path: _Path.settings,
      name: AppRoutes.settings,
      builder: (context, state) => const SettingsScreen(),
    ),
    GoRoute(
      path: _Path.webView,
      name: AppRoutes.webView,
      builder: (BuildContext context, GoRouterState state) {
        final name = state.extra as AdvertisementEntity;
        return WebViewScreen(
          item: name,
        );
      },
    ),
    GoRoute(
      path: _Path.error,
      name: AppRoutes.error,
      builder: (context, state) => const ErrorScreen(),
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

void popUntilHome(BuildContext context) {
  final router = GoRouter.of(context);
  while (
      router.routerDelegate.currentConfiguration.matches.last.matchedLocation !=
          _Path.home) {
    if (!context.canPop()) {
      return;
    }
    context.pop();
  }
}
