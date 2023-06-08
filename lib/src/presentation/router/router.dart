import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:i_home/src/presentation/pages/home_page/home_page.dart';
import 'package:i_home/src/presentation/pages/on_boarding_page/on_boarding_page.dart';
import 'package:i_home/src/presentation/pages/sign_in_page/sign_in_page.dart';
import 'package:i_home/src/presentation/utils/string_manager.dart';

class Routes {
  static const String boardingRoute = '/';
  static const String signInRoute = '/signInRoute';
  static const String homeRoute = '/homeRoute';
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.boardingRoute:
        return MaterialPageRoute(builder: (_) => const BoardingPage());
      case Routes.homeRoute:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case Routes.signInRoute:
        return MaterialPageRoute(builder: (_) => const SignInPage());
      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text(StringManager.noRouteFound),
        ),
        body: const Center(
          child: Text(StringManager.noRouteFound),
        ),
      ),
    );
  }
}
