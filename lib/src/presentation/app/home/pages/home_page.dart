import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:i_home/src/bloc/device_bloc/device_bloc.dart';
import 'package:i_home/src/presentation/app/devices/widgets/smart_box_widget.dart';
import 'package:i_home/src/presentation/app/home/widgets/home_page_smart_speaker.dart';
import 'package:i_home/src/presentation/app/home/widgets/home_page_smart_weather.dart';
import 'package:i_home/src/presentation/utils/managers/color_manager.dart';
import 'package:i_home/src/presentation/utils/managers/list_manager.dart';
import 'package:i_home/src/presentation/utils/managers/size_manager.dart';
import 'package:i_home/src/presentation/widgets/spacers.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DeviceBloc, DeviceState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: ColorManager.primaryDarkGrey,
          body: SafeArea(
            child: SizedBox(
              width: SizeManager.deviceWidth,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: PaddingManager.p24.w,
                  vertical: PaddingManager.p12.h,
                ),
                child: SingleChildScrollView(
                  physics: const NeverScrollableScrollPhysics(),
                  child: Column(
                    children: [
                      const HomePageSmartWeather(),
                      const HeightSpacer(iH: SizeManager.s20),
                      const HomePageSmartSpeaker(),
                      const HeightSpacer(iH: SizeManager.s20),
                      SizedBox(
                        width: SizeManager.deviceWidth,
                        height: SizeManager.deviceHeight / 2,
                        child: GridView.builder(
                          itemCount: 4,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 1 / 1.2,
                          ),
                          itemBuilder: (context, index) {
                            return SmartBoxWidget(
                              name: ListManager.deviceList[index][0],
                              type: ListManager.deviceList[index][1],
                              image: ListManager.deviceList[index][2],
                              isOnValue: ListManager.deviceList[index][3],
                              onChaned: (value) {
                                context
                                    .read<DeviceBloc>()
                                    .add(SwitchValueEvent(index, value));
                              },
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
