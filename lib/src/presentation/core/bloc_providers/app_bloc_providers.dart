import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_home/src/app/bottom_bar_bloc/bottom_bar_bloc_bloc.dart';
import 'package:i_home/src/app/on_boarding_bloc/on_boarding_bloc_bloc.dart';
import 'package:i_home/src/app/register_bloc/register_bloc.dart';
import 'package:i_home/src/app/settings_bloc/settings_bloc.dart';
import 'package:i_home/src/app/sign_in_bloc/sign_in_bloc.dart';

class AppBlocProviders {
  static get allBlocProviders => [
        BlocProvider(
          create: (context) => OnBoardingBlocBloc(),
        ),
        BlocProvider(
          create: (context) => SignInBloc(),
        ),
        BlocProvider(
          create: (context) => RegisterBloc(),
        ),
        BlocProvider(
          create: (context) => BottomBarBlocBloc(),
        ),
        BlocProvider(
          create: (context) => SettingsBloc(),
        ),
      ];
}
