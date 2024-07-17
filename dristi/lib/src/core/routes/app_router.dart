import 'package:dristi/src/core/global_entities/gallery_screen_entity.dart';
import 'package:dristi/src/core/global_widgets/error_screen.dart';
import 'package:dristi/src/core/global_widgets/web_view_screen.dart';
import 'package:dristi/src/core/routes/app_routes.dart';
import 'package:dristi/src/core/routes/navigation_helper.dart';
import 'package:dristi/src/core/utils/localization_ext.dart';
import 'package:dristi/src/features/accommodations_list/presentation/pages/accommodations_list_screen.dart';
import 'package:dristi/src/core/global_widgets/bottom_navigation_bar.dart';
import 'package:dristi/src/features/destinations_list/presentation/pages/destinations_list_screen.dart';
import 'package:dristi/src/features/districts/presentation/pages/districts_list_screen.dart';
import 'package:dristi/src/features/gallery/presentation/pages/gallery_screen.dart';
import 'package:dristi/src/features/gallery/presentation/pages/image_view_screen.dart';
import 'package:dristi/src/features/home/advertisements/domain/entity/advertisement_entity.dart';
import 'package:dristi/src/features/home/home_screen/pages/home_screen.dart';
import 'package:dristi/src/features/accommodation/presentation/pages/accommodation_screen.dart';
import 'package:dristi/src/features/on_boarding/presentation/pages/on_boarding_screen.dart';
import 'package:dristi/src/features/settings/presentation/pages/settings_screen.dart';
import 'package:dristi/src/features/destination/presentation/pages/destination_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

abstract class _Path {
  static const String home = '/home';
  static const String bottomNavBar = '/bottomNavBar';
  static const String splash = '/splash';
  static const String destination = '/destination/:destinationId/:instanceId';
  static const String destinationsList = '/destinationsList';
  static const String accommodation =
      '/accommodation/:accommodationId/:instanceId';
  static const String accommodationsList = '/accommodationsList';
  static const String districts = '/districts';
  static const String settings = '/settings';
  static const String gallery = '/gallery';
  static const String imageView = '/imageView';
  static const String webView = '/webView';
  static const String error = '/error';
}

abstract class PathParameter {
  static const String destinationId = 'destinationId';
  static const String accommodationId = 'accommodationId';
  static const String instanceId = 'instanceId';
  static const String name = 'name';
  static const String images = 'images';
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
      path: _Path.bottomNavBar,
      name: AppRoutes.bottomNavBar,
      builder: (context, state) => const BottomNavigation(),
    ),
    GoRoute(
      path: _Path.home,
      name: AppRoutes.home,
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: _Path.destination,
      name: AppRoutes.destination,
      builder: (context, state) {
        final id = state.pathParameters[PathParameter.destinationId]!;
        final instanceId = state.pathParameters[PathParameter.instanceId]!;
        return DestinationScreen(
          id: id,
          instanceId: instanceId,
        );
      },
    ),
    GoRoute(
      path: _Path.destinationsList,
      name: AppRoutes.destinationsList,
      builder: (context, state) {
        return const DestinationsListScreen();
      },
    ),
    GoRoute(
      path: _Path.accommodation,
      name: AppRoutes.accommodation,
      builder: (context, state) {
        final id = state.pathParameters[PathParameter.accommodationId]!;
        final instanceId = state.pathParameters[PathParameter.instanceId]!;
        return AccommodationScreen(
          id: id,
          instanceId: instanceId,
        );
      },
    ),
    GoRoute(
      path: _Path.accommodationsList,
      name: AppRoutes.accommodationsList,
      builder: (context, state) {
        return const AccommodationsListScreen();
      },
    ),
    GoRoute(
      path: _Path.districts,
      name: AppRoutes.districts,
      builder: (context, state) => const DistrictsScreen(),
    ),
    GoRoute(
      path: _Path.settings,
      name: AppRoutes.settings,
      builder: (context, state) => const SettingsScreen(),
    ),
    GoRoute(
      path: _Path.gallery,
      name: AppRoutes.gallery,
      builder: (context, state) {
        return GalleryScreen(
          arguments: state.extra as GalleryScreenEntity,
        );
      },
    ),
    GoRoute(
      path: _Path.imageView,
      name: AppRoutes.imageView,
      builder: (context, state) {
        return ImageViewerScreen(
          arguments: state.extra as GalleryScreenEntity,
        );
      },
    ),
    GoRoute(
      path: _Path.webView,
      name: AppRoutes.webView,
      builder: (BuildContext context, GoRouterState state) {
        final extra = state.extra;
        AdvertisementEntity? item;
        String? url;

        if (extra is AdvertisementEntity) {
          item = extra;
        } else if (extra is String) {
          url = extra;
        }

        return WebViewScreen(
          item: item,
          url: url,
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
