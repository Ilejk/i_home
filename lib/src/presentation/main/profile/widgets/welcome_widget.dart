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

class WelcomeWidget extends StatelessWidget {
  const WelcomeWidget({
    super.key,
    required this.onTap,
  });
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeManager.s80.w,
      width: SizeManager.deviceWidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(SizeManager.s50),
        color: ColorManager.secondaryDarkGrey,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: SizeManager.s80.w,
            width: SizeManager.s80.w,
            decoration: BoxDecoration(
              color: ColorManager.secondaryDarkGrey,
              border: Border.all(
                color: ColorManager.accentDarkYellow,
                width: SizeManager.s1.w,
              ),
              borderRadius: BorderRadius.circular(SizeManager.s50),
            ),
            child: GestureDetector(
              onTap: onTap,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(SizeManager.s50),
                child: Image.asset(
                  ImageManager.homeSpotify,
                  //TODO
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          const WidthSpacer(iW: SizeManager.s65),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextWidget(
                text: StringManager.welcome,
                style: appTextStyleWidget(
                  size: FontSize.s20,
                  color: ColorManager.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
              TextWidget(
                //TODO
                text: 'Adrian Skiba',
                style: appTextStyleWidget(
                  size: FontSize.s17,
                  color: ColorManager.white,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
