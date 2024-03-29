import 'package:flutter/material.dart';
import 'package:i_home/src/presentation/app/home/pages/device_detail/pages/device_detail_page.dart';
import 'package:i_home/src/presentation/app/profile/pages/settings/pages/change_password/pages/change_password_page.dart';
import 'package:i_home/src/presentation/app/profile/pages/settings/pages/edit_account/pages/edit_account_page.dart';
import 'package:i_home/src/presentation/auth/auth/pages/auth_page.dart';
import 'package:i_home/src/presentation/auth/forgot_password/pages/forgot_password_page.dart';
import 'package:i_home/src/presentation/app/home/pages/home_page.dart';
import 'package:i_home/src/presentation/app/main/pages/main_page.dart';
import 'package:i_home/src/presentation/app/home/pages/music/pages/music_page.dart';
import 'package:i_home/src/presentation/app/on_boarding/pages/on_boarding_page.dart';
import 'package:i_home/src/presentation/app/profile/pages/achievements/pages/achievements_page.dart';
import 'package:i_home/src/presentation/app/profile/pages/connections/pages/connections_page.dart';
import 'package:i_home/src/presentation/app/profile/pages/help/pages/help_page.dart';
import 'package:i_home/src/presentation/app/profile/pages/payment/pages/payment_page.dart';
import 'package:i_home/src/presentation/app/profile/pages/profile_page.dart';
import 'package:i_home/src/presentation/auth/register/pages/register_page.dart';
import 'package:i_home/src/presentation/auth/login/pages/sign_in_page.dart';
import 'package:i_home/src/presentation/app/profile/pages/settings/pages/settings_page.dart';
import 'package:i_home/src/presentation/app/speak/pages/speak_page.dart';
import 'package:i_home/src/presentation/utils/managers/string_manager.dart';

class Routes {
  static const String boardingRoute = '/';
  static const String mainRoute = '/mainRoute';
  static const String authRoute = '/authRoute';
  static const String signInRoute = '/signInRoute';
  static const String homeRoute = '/homeRoute';
  static const String speakRoute = '/speakRoute';
  static const String registerRoute = '/registerRoute';
  static const String forgotPasswordRoute = '/forgotPasswordRoute';
  static const String profileRoute = '/profileRoute';
  static const String musicRoute = '/musicRoute';
  static const String settingsRoute = '/settingsRoute';
  static const String connectionsRoute = '/connectionsRoute';
  static const String achievementsRoute = '/achievementsRoute';
  static const String helpRoute = '/helpRoute';
  static const String paymentRoute = '/paymentRoute';
  static const String editAccountRoute = '/editAccountRoute';
  static const String changePasswordRoute = '/changePasswordRoute';
  static const String deviceDetailRoute = '/deviceDetailRoute';
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
      case Routes.speakRoute:
        return MaterialPageRoute(builder: (_) => const SpeakPage());
      case Routes.deviceDetailRoute:
        final index = routeSettings.arguments as Map<String, dynamic>? ?? {};
        return MaterialPageRoute(
            builder: (_) => DeviceDetailPage(index: index['index']));
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
      case Routes.editAccountRoute:
        return MaterialPageRoute(builder: (_) => const EditAccountPage());
      case Routes.changePasswordRoute:
        return MaterialPageRoute(builder: (_) => const ChangePasswordPage());

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
