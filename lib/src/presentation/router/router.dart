import 'package:flutter/material.dart';
import 'package:i_home/src/presentation/auth/auth_page.dart';
import 'package:i_home/src/presentation/pages/devices_page/devices_page.dart';
import 'package:i_home/src/presentation/pages/forgot_password_page/forgot_password_page.dart';
import 'package:i_home/src/presentation/pages/home_page/home_page.dart';
import 'package:i_home/src/presentation/pages/main_page/main_page.dart';
import 'package:i_home/src/presentation/pages/modes_page/modes_page.dart';
import 'package:i_home/src/presentation/pages/music_page/music_page.dart';
import 'package:i_home/src/presentation/pages/on_boarding_page/on_boarding_page.dart';
import 'package:i_home/src/presentation/pages/profile_page/profile_page.dart';
import 'package:i_home/src/presentation/pages/register_page/register_page.dart';
import 'package:i_home/src/presentation/pages/schedule_page/schedule_page.dart';
import 'package:i_home/src/presentation/pages/sign_in_page/sign_in_page.dart';
import 'package:i_home/src/presentation/pages/speak_page/speak_page.dart';
import 'package:i_home/src/presentation/utils/managers/string_manager.dart';

class Routes {
  static const String boardingRoute = '/';
  static const String mainRoute = '/mainRoute';
  static const String authRoute = '/authRoute';
  static const String signInRoute = '/signInRoute';
  static const String homeRoute = '/homeRoute';
  static const String devicesRoute = '/devicesRoute';
  static const String speakRoute = '/speakRoute';
  static const String modesRoute = '/modesRoute';
  static const String scheduleRoute = '/scheduleRoute';
  static const String registerRoute = '/registerRoute';
  static const String forgotPasswordRoute = '/forgotPasswordRoute';
  static const String profileRoute = '/profileRoute';
  static const String musicRoute = '/musicRoute';
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
      case Routes.authRoute:
        return MaterialPageRoute(builder: (_) => const AuthPage());
      case Routes.mainRoute:
        return MaterialPageRoute(builder: (_) => const MainPage());
      case Routes.devicesRoute:
        return MaterialPageRoute(builder: (_) => const DevicesPage());
      case Routes.speakRoute:
        return MaterialPageRoute(builder: (_) => const SpeakPage());
      case Routes.modesRoute:
        return MaterialPageRoute(builder: (_) => const ModesPage());
      case Routes.scheduleRoute:
        return MaterialPageRoute(builder: (_) => const SchedulePage());
      case Routes.registerRoute:
        return MaterialPageRoute(builder: (_) => const RegisterPage());
      case Routes.forgotPasswordRoute:
        return MaterialPageRoute(builder: (_) => const ForgotPasswordPage());
      case Routes.profileRoute:
        return MaterialPageRoute(builder: (_) => const ProfilePage());
      case Routes.musicRoute:
        return MaterialPageRoute(builder: (_) => const MusicPage());
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
