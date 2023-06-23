import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:i_home/src/bloc/weather_bloc/weather_bloc_bloc.dart';
import 'package:i_home/src/presentation/utils/global/global_methods.dart';
import 'package:i_home/src/presentation/utils/managers/asset_manager.dart';
import 'package:i_home/src/presentation/utils/managers/color_manager.dart';
import 'package:i_home/src/presentation/utils/managers/font_manager.dart';
import 'package:i_home/src/presentation/utils/managers/size_manager.dart';
import 'package:i_home/src/presentation/widgets/app_textstyle_widget.dart';
import 'package:i_home/src/presentation/widgets/text_widget.dart';

class HomePageSmartWeather extends StatefulWidget {
  const HomePageSmartWeather({
    super.key,
  });

  @override
  State<HomePageSmartWeather> createState() => _HomePageSmartWeatherState();
}

class _HomePageSmartWeatherState extends State<HomePageSmartWeather> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<WeatherBlocBloc>().add(WeatherBlocEvent());
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBlocBloc, WeatherBlocState>(
      builder: (context, state) {
        if (state.isLoading) {
          return GBM.spinkit;
        } else if (state.error.isNotEmpty) {
          return Text('Error');
        }
        return Container(
          width: SizeManager.deviceWidth,
          height: SizeManager.s60.h,
          decoration: BoxDecoration(
            color: ColorManager.secondaryDarkGrey,
            borderRadius: BorderRadius.circular(SizeManager.s40),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Stack(
                children: [
                  SizedBox(
                    height: SizeManager.s60.h,
                    width: SizeManager.s150.w,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(SizeManager.s40),
                      child: Image.asset(
                        state.photo,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Positioned(
                    left: SizeManager.s85.w,
                    top: SizeManager.s15.h,
                    child: TextWidget(
                      text: '${state.temperature} C',
                      align: TextAlign.center,
                      style: appTextStyleWidget(
                        size: FontSize.s20,
                        color: ColorManager.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextWidget(
                      text: state.cityName,
                      align: TextAlign.center,
                      style: appTextStyleWidget(
                        size: FontSize.s20,
                        color: ColorManager.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    TextWidget(
                      text: state.weatherCondition,
                      align: TextAlign.center,
                      style: appTextStyleWidget(
                        size: FontSize.s15,
                        color: ColorManager.white,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
