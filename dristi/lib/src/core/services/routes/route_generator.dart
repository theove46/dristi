import 'package:dristi/src/core/services/routes/routes.dart';
import 'package:dristi/src/features/districts/presentation/pages/districts_list_page.dart';
import 'package:dristi/src/features/home/home_page/pages/home_page.dart';
import 'package:dristi/src/features/splash/presentation/pages/splash_page.dart';
import 'package:dristi/src/features/spot/presentation/pages/spot_page.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static void get controller {}

  static Route<dynamic>? generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.home:
        return MaterialPageRoute(
          builder: (_) => const HomePage(),
        );

      case Routes.splash:
        return MaterialPageRoute(
          builder: (_) => const SplashPage(),
        );

      case Routes.spot:
        return MaterialPageRoute(
          builder: (_) => const SpotPage(),
        );

      case Routes.districts:
        return MaterialPageRoute(
          builder: (_) => const DistrictsPage(),
        );

      default:
        return null;
    }
  }
}
