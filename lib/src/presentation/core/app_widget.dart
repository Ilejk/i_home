import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:i_home/src/app/on_boarding_bloc/on_boarding_bloc_bloc.dart';
import 'package:i_home/src/presentation/router/router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnBoardingBlocBloc(),
      child: ScreenUtilInit(
        builder: (context, child) => const MaterialApp(
          debugShowCheckedModeBanner: false,
          onGenerateRoute: RouteGenerator.getRoute,
          initialRoute: Routes.boardingRoute,
        ),
        designSize: const Size(375, 825),
        useInheritedMediaQuery: true,
        minTextAdapt: true,
      ),
    );
  }
}
