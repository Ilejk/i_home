import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:i_home/src/presentation/pages/home_page/widgets/home_page_smart_speaker.dart';
import 'package:i_home/src/presentation/pages/home_page/widgets/home_page_smart_weather.dart';
import 'package:i_home/src/presentation/pages/home_page/widgets/now_playing.dart';
import 'package:i_home/src/presentation/pages/home_page/widgets/quick_access_spacer_widget.dart';
import 'package:i_home/src/presentation/utils/managers/asset_manager.dart';
import 'package:i_home/src/presentation/utils/managers/color_manager.dart';
import 'package:i_home/src/presentation/utils/managers/font_manager.dart';
import 'package:i_home/src/presentation/utils/managers/size_manager.dart';
import 'package:i_home/src/presentation/utils/managers/string_manager.dart';
import 'package:i_home/src/presentation/widgets/app_textstyle_widget.dart';
import 'package:i_home/src/presentation/widgets/spacers.dart';
import 'package:i_home/src/presentation/widgets/text_widget.dart';
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
          child: PageView(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: PaddingManager.p24.w,
                  vertical: PaddingManager.p12.h,
                ),
                child: Column(
                  children: [
                    HomePageSmartWeather(
                      onTap: () {
                        //TODO
                      },
                    ),
                    const HeightSpacer(iH: SizeManager.s20),
                    const HomePageSmartSpeaker(),
                    const HeightSpacer(iH: SizeManager.s20),
                    QuickAccessSpacer(
                      onTap: () {
                        //TODO
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
