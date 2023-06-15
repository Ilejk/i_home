import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:i_home/src/presentation/main/home/widgets/now_playing.dart';
import 'package:i_home/src/presentation/utils/managers/asset_manager.dart';
import 'package:i_home/src/presentation/utils/managers/color_manager.dart';
import 'package:i_home/src/presentation/utils/managers/font_manager.dart';
import 'package:i_home/src/presentation/utils/managers/size_manager.dart';
import 'package:i_home/src/presentation/utils/managers/string_manager.dart';
import 'package:i_home/src/presentation/widgets/app_textstyle_widget.dart';
import 'package:i_home/src/presentation/widgets/spacers.dart';
import 'package:i_home/src/presentation/widgets/text_widget.dart';

class HomePageSmartSpeaker extends StatelessWidget {
  const HomePageSmartSpeaker({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeManager.s170.h,
      width: SizeManager.deviceWidth,
      decoration: BoxDecoration(
        color: ColorManager.secondaryDarkGrey,
        borderRadius: BorderRadius.circular(SizeManager.s20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: PaddingManager.p10.w,
                  vertical: PaddingManager.p15.h,
                ),
                child: Container(
                  width: SizeManager.s197.w,
                  height: SizeManager.s30.h,
                  decoration: BoxDecoration(
                    color: ColorManager.accentDarkGrey,
                    borderRadius: BorderRadius.circular(SizeManager.s40),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextWidget(
                        text: StringManager.smartSpeaker,
                        style: appTextStyleWidget(
                          size: FontSize.s10,
                          letterSpacing: SizeManager.s1,
                          color: ColorManager.white,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      const WidthSpacer(iW: SizeManager.s10),
                      TextWidget(
                        text: StringManager.broadcasting,
                        style: appTextStyleWidget(
                          size: FontSize.s10,
                          letterSpacing: SizeManager.s1,
                          color: ColorManager.accentDarkYellow,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const HeightSpacer(iH: SizeManager.s10),
              Padding(
                padding: EdgeInsets.only(
                  left: PaddingManager.p10.w,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(
                      text: StringManager.homeSongBand,
                      style: appTextStyleWidget(
                        size: FontSize.s12,
                        color: ColorManager.white54,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    const HeightSpacer(iH: SizeManager.s2),
                    TextWidget(
                      text: StringManager.homeSongTitle,
                      style: appTextStyleWidget(
                        size: FontSize.s17,
                        color: ColorManager.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const HeightSpacer(iH: SizeManager.s20),
                    Row(
                      children: [
                        const Icon(
                          Icons.bluetooth,
                          color: ColorManager.white54,
                          size: SizeManager.s15,
                        ),
                        TextWidget(
                          text: StringManager.homeDevice,
                          style: appTextStyleWidget(
                            size: FontSize.s12,
                            color: ColorManager.white54,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(SizeManager.s20),
                  bottomRight: Radius.circular(SizeManager.s20),
                ),
                child: SizedBox(
                  width: SizeManager.s110.w,
                  height: SizeManager.s170.h,
                  child: Image.asset(
                    ImageManager.homeSpotify,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                width: SizeManager.s110.w,
                height: SizeManager.s170.h,
                decoration: const BoxDecoration(
                  color: ColorManager.black26,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(SizeManager.s20),
                    bottomRight: Radius.circular(SizeManager.s20),
                  ),
                ),
              ),
              Positioned(
                left: SizeManager.s48.w,
                top: SizeManager.s70.h,
                child: const NowPlayingWidget(),
              )
            ],
          )
        ],
      ),
    );
  }
}
