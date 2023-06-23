import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:i_home/src/bloc/bottom_bar_bloc/bottom_bar_bloc_bloc.dart';
import 'package:i_home/src/bloc/change_password/change_password_bloc.dart';
import 'package:i_home/src/bloc/device_bloc/device_bloc.dart';
import 'package:i_home/src/bloc/edit_account_bloc/edit_account_bloc.dart';
import 'package:i_home/src/bloc/forgot_password_bloc/forgot_password_bloc.dart';
import 'package:i_home/src/bloc/on_boarding_bloc/on_boarding_bloc_bloc.dart';
import 'package:i_home/src/bloc/profile_bloc/profile_bloc.dart';
import 'package:i_home/src/bloc/register_bloc/register_bloc.dart';
import 'package:i_home/src/bloc/sign_in_bloc/sign_in_bloc.dart';
import 'package:i_home/src/bloc/weather_bloc/weather_bloc_bloc.dart';
import 'package:i_home/src/domain/repo/device_repository.dart';

class AppBlocProviders {
  static get allBlocProviders => [
        BlocProvider(create: (context) => OnBoardingBlocBloc()),
        BlocProvider(create: (context) => SignInBloc()),
        BlocProvider(create: (context) => RegisterBloc()),
        BlocProvider(create: (context) => BottomBarBlocBloc()),
        BlocProvider(create: (context) => ChangePasswordBloc()),
        BlocProvider(create: (context) => EditAccountBloc()),
        BlocProvider(create: (context) => ForgotPasswordBloc()),
        BlocProvider(create: (context) => ProfileBloc()),
        BlocProvider(
            create: (context) => WeatherBlocBloc(GeolocatorPlatform.instance)),
        BlocProvider(
            create: (context) => DeviceBloc(DeviceRepository(context))),
      ];
}
