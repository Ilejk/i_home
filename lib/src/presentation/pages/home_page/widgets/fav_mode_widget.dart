import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:i_home/src/presentation/utils/managers/asset_manager.dart';
import 'package:i_home/src/presentation/utils/managers/color_manager.dart';
import 'package:i_home/src/presentation/utils/managers/font_manager.dart';
import 'package:i_home/src/presentation/utils/managers/size_manager.dart';
import 'package:i_home/src/presentation/utils/managers/string_manager.dart';
import 'package:i_home/src/presentation/widgets/app_textstyle_widget.dart';
import 'package:i_home/src/presentation/widgets/spacers.dart';
import 'package:i_home/src/presentation/widgets/text_widget.dart';
import 'package:slide_to_act/slide_to_act.dart';

class FavModesWidget extends StatelessWidget {
  const FavModesWidget({
    super.key,
    required this.iconData,
    required this.modeName,
    required this.timeSet,
    required this.setUpMode,
    required this.onSubmit,
  });
  final IconData iconData;
  final String modeName;
  final String timeSet;
  final String setUpMode;
  final VoidCallback onSubmit;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: PaddingManager.p12.h),
      child: Container(
        height: SizeManager.s150.h,
        width: SizeManager.deviceWidth,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(SizeManager.s20),
          color: ColorManager.secondaryDarkGrey,
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(PaddingManager.p12.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextWidget(
                    text: modeName,
                    style: appTextStyleWidget(
                      size: FontSize.s15,
                      color: ColorManager.accentDarkYellow,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  Icon(
                    iconData,
                    color: ColorManager.white,
                  ),
                ],
              ),
            ),
            const HeightSpacer(iH: SizeManager.s25),
            Padding(
              padding: EdgeInsets.all(PaddingManager.p12.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(
                        text: setUpMode,
                        style: appTextStyleWidget(
                          size: FontSize.s12,
                          color: ColorManager.white54,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      TextWidget(
                        text: timeSet,
                        style: appTextStyleWidget(
                          size: FontSize.s17,
                          color: ColorManager.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: SizeManager.s50.h,
                    width: SizeManager.s190.w,
                    child: SlideAction(
                      outerColor: ColorManager.primaryDarkGrey,
                      innerColor: ColorManager.accentDarkGrey,
                      sliderButtonIcon: SizedBox(
                        height: SizeManager.s15.h,
                        width: SizeManager.s15.w,
                        child: Image.asset(
                          ImageManager.homeTurnOn,
                          color: ColorManager.white,
                          fit: BoxFit.fill,
                        ),
                      ),
                      text: StringManager.startModes,
                      textStyle: appTextStyleWidget(
                        size: FontSize.s15,
                        color: ColorManager.white54,
                        fontWeight: FontWeight.normal,
                      ),
                      onSubmit: onSubmit,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
