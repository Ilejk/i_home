import 'package:flutter/material.dart';
import 'package:i_home/src/presentation/auth/auth/pages/auth_page.dart';
import 'package:i_home/src/presentation/main/devices/pages/devices_page.dart';
import 'package:i_home/src/presentation/auth/forgot_password/pages/forgot_password_page.dart';
import 'package:i_home/src/presentation/main/home/pages/home_page.dart';
import 'package:i_home/src/presentation/main/navigation/pages/navigation_page.dart';
import 'package:i_home/src/presentation/main/modes/pages/modes_page.dart';
import 'package:i_home/src/presentation/main/music/pages/music_page.dart';
import 'package:i_home/src/presentation/main/on_boarding/pages/on_boarding_page.dart';
import 'package:i_home/src/presentation/main/profile/pages/achievements/pages/achievements_page.dart';
import 'package:i_home/src/presentation/main/profile/pages/connections/pages/connections_page.dart';
import 'package:i_home/src/presentation/main/profile/pages/help/pages/help_page.dart';
import 'package:i_home/src/presentation/main/profile/pages/payment/pages/payment_page.dart';
import 'package:i_home/src/presentation/main/profile/pages/profile_page.dart';
import 'package:i_home/src/presentation/auth/register/pages/register_page.dart';
import 'package:i_home/src/presentation/main/schedule/pages/schedule_page.dart';
import 'package:i_home/src/presentation/auth/login/pages/sign_in_page.dart';
import 'package:i_home/src/presentation/main/profile/pages/settings/pages/settings_page.dart';
import 'package:i_home/src/presentation/main/speak/pages/speak_page.dart';
import 'package:i_home/src/presentation/utils/managers/string_manager.dart';

class Routes {
  static const String boardingRoute = '/';
  static const String navigationRoute = '/navigationRoute';
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
  static const String settingsRoute = '/settingsRoute';
  static const String connectionsRoute = '/connectionsRoute';
  static const String achievementsRoute = '/achievementsRoute';
  static const String helpRoute = '/helpRoute';
  static const String paymentRoute = '/paymentRoute';
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
      case Routes.navigationRoute:
        return MaterialPageRoute(builder: (_) => const NavigationPage());
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
      case Routes.settingsRoute:
        return MaterialPageRoute(builder: (_) => const SettingsPage());
      case Routes.paymentRoute:
        return MaterialPageRoute(builder: (_) => const PaymentPage());
      case Routes.helpRoute:
        return MaterialPageRoute(builder: (_) => const HelpPage());
      case Routes.connectionsRoute:
        return MaterialPageRoute(builder: (_) => const ConnectionsPage());
      case Routes.achievementsRoute:
        return MaterialPageRoute(builder: (_) => const AchievementsPage());
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
