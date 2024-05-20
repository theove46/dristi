import 'package:dristi/src/core/services/routes/app_routes.dart';
import 'package:dristi/src/features/destinations/presentation/pages/destinations_list_screen.dart';
import 'package:dristi/src/features/districts/presentation/pages/districts_list_screen.dart';
import 'package:dristi/src/features/home/home_screen/pages/home_screen.dart';
import 'package:dristi/src/features/splash/presentation/pages/splash_screen.dart';
import 'package:dristi/src/features/spot/presentation/pages/spot_screen.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static void get controller {}

  static Route<dynamic>? generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case AppRoutes.splash:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );

      case AppRoutes.home:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );

      case AppRoutes.spot:
        return MaterialPageRoute(
          builder: (_) => const SpotScreen(),
        );

      case AppRoutes.districts:
        return MaterialPageRoute(
          builder: (_) => const DistrictsScreen(),
        );

      case AppRoutes.destination:
        return MaterialPageRoute(
          builder: (_) => const DestinationScreen(),
        );

      default:
        return null;
    }
  }
}
