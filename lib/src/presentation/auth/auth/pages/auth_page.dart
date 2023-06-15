import 'package:flutter/material.dart';
import 'package:i_home/src/presentation/auth/login/pages/sign_in_page.dart';
import 'package:i_home/src/presentation/main/navigation/pages/navigation_page.dart';
import 'package:i_home/src/presentation/main/on_boarding/pages/on_boarding_page.dart';
import 'package:i_home/src/presentation/utils/global/global_methods.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
    );
  }

  StatefulWidget getBody() {
    var isLoggedIn = GBM.storageService.getDeviceFirstOpen() == true &&
        GBM.storageService.getIsLoggedIn() == true;
    var isNotNewIsNotLoggedIn =
        GBM.storageService.getDeviceFirstOpen() == true &&
            GBM.storageService.getIsLoggedIn() == false;
    var isNewUser = GBM.storageService.getDeviceFirstOpen() == false &&
        GBM.storageService.getIsLoggedIn() == false;
    if (isLoggedIn) {
      return const NavigationPage();
    } else if (isNotNewIsNotLoggedIn) {
      return const SignInPage();
    } else if (isNewUser) {
      return const BoardingPage();
    }
    return const Scaffold();
  }
}
