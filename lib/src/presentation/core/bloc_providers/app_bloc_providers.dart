import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:i_home/src/domain/repo/device_repository.dart';
import '../../../domain/auth/change_password/change_password_bloc.dart';
import '../../../domain/auth/forgot_password_bloc/forgot_password_bloc.dart';
import '../../../domain/auth/register_bloc/register_bloc.dart';
import '../../../domain/auth/sign_in_bloc/sign_in_bloc.dart';
import '../../../domain/core/bottom_bar_bloc/bottom_bar_bloc_bloc.dart';
import '../../../domain/core/device_bloc/device_bloc.dart';
import '../../../domain/core/edit_account_bloc/edit_account_bloc.dart';
import '../../../domain/core/on_boarding_bloc/on_boarding_bloc_bloc.dart';
import '../../../domain/core/profile_bloc/profile_bloc.dart';
import '../../../domain/core/weather_bloc/weather_bloc_bloc.dart';

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
