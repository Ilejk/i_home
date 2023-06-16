import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_home/src/bloc/bottom_bar_bloc/bottom_bar_bloc_bloc.dart';
import 'package:i_home/src/bloc/on_boarding_bloc/on_boarding_bloc_bloc.dart';
import 'package:i_home/src/bloc/profile_bloc/profile_bloc.dart';
import 'package:i_home/src/bloc/register_bloc/register_bloc.dart';
import 'package:i_home/src/bloc/settings_bloc/settings_bloc.dart';
import 'package:i_home/src/bloc/sign_in_bloc/sign_in_bloc.dart';

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
        BlocProvider(
          create: (context) => ProfileBloc(),
        ),
      ];
}
