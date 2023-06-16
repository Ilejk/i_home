import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:i_home/src/presentation/app/home/widgets/fav_mode_widget.dart';
import 'package:i_home/src/presentation/app/home/widgets/fav_mods_spacer.dart';
import 'package:i_home/src/presentation/app/home/widgets/home_device_widget.dart';
import 'package:i_home/src/presentation/app/home/widgets/home_page_smart_speaker.dart';
import 'package:i_home/src/presentation/app/home/widgets/home_page_smart_weather.dart';
import 'package:i_home/src/presentation/app/home/widgets/quick_access_spacer_widget.dart';
import 'package:i_home/src/presentation/utils/managers/asset_manager.dart';
import 'package:i_home/src/presentation/utils/managers/color_manager.dart';
import 'package:i_home/src/presentation/utils/managers/size_manager.dart';
import 'package:i_home/src/presentation/widgets/spacers.dart';
import 'package:iconly/iconly.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
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
            child: Column(
              children: [
                const HomePageSmartWeather(),
                const HeightSpacer(iH: SizeManager.s20),
                const HomePageSmartSpeaker(),
                const HeightSpacer(iH: SizeManager.s20),
                const QuickAccessSpacer(),
                SizedBox(
                  height: SizeManager.s150.h,
                  child: ListView.builder(
                    itemCount: 5,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      //TODO
                      return HomeDeviceWidget(
                        deviceType: 'Smart TV',
                        deviceName: 'Samsung 56"Neo QLED 4KQN98B',
                        deviceIcon: ImageManager.homeSmartTv,
                        onChanged: (switchValue) {
                          //TODO
                        },
                        switchValue: true,
                      );
                    },
                  ),
                ),
                const HeightSpacer(iH: SizeManager.s20),
                const FavModsSpacer(),
                const HeightSpacer(iH: SizeManager.s10),
                SizedBox(
                  height: SizeManager.s150.h,
                  child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return FavModesWidget(
                        iconData: IconlyLight.notification,
                        modeName: 'Good Monday morning!',
                        timeSet: '6:00AM',
                        setUpMode: 'Every Monday',
                        onSubmit: () {
                          //TODO
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
