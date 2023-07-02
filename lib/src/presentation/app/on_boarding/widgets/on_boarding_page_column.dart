import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:i_home/src/presentation/utils/managers/color_manager.dart';
import 'package:i_home/src/presentation/utils/managers/font_manager.dart';
import 'package:i_home/src/presentation/utils/managers/size_manager.dart';
import 'package:i_home/src/presentation/widgets/app_textstyle_widget.dart';
import 'package:i_home/src/presentation/widgets/spacers.dart';
import 'package:i_home/src/presentation/widgets/text_widget.dart';

class OnBoardingPageColumn extends StatelessWidget {
  const OnBoardingPageColumn(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.onTap,
      required this.buttonTitle,
      required this.photoGridType});
  final String title;
  final String subtitle;
  final VoidCallback onTap;
  final String buttonTitle;
  final Widget photoGridType;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: PaddingManager.p24,
        right: PaddingManager.p24,
        bottom: PaddingManager.p24,
      ),
      child: Column(
        children: [
          photoGridType,
          const HeightSpacer(iH: SizeManager.s20),
          TextWidget(
            text: title,
            maxLines: 2,
            align: TextAlign.center,
            style: appTextStyleWidget(
              size: FontSize.s30,
              color: ColorManager.white,
              fontWeight: FontWeight.normal,
            ),
          ),
          const HeightSpacer(iH: SizeManager.s10),
          TextWidget(
            maxLines: 2,
            align: TextAlign.center,
            text: subtitle,
            style: appTextStyleWidget(
              size: FontSize.s15,
              color: ColorManager.white54,
              fontWeight: FontWeight.normal,
            ),
          ),
          const HeightSpacer(iH: SizeManager.s20),
          GestureDetector(
            onTap: onTap,
            child: Container(
              width: SizeManager.s345.w,
              height: SizeManager.s50.h,
              decoration: BoxDecoration(
                color: ColorManager.primaryDarkGrey,
                borderRadius: BorderRadius.circular(
                  SizeManager.s15.w,
                ),
                border: Border.all(
                  color: ColorManager.accentDarkYellow,
                  width: SizeManager.s2_5.w,
                ),
                boxShadow: const [
                  BoxShadow(
                    color: ColorManager.black87,
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(5, 5),
                  )
                ],
              ),
              child: Center(
                child: TextWidget(
                  text: buttonTitle,
                  style: appTextStyleWidget(
                    letterSpacing: SizeManager.s2,
                    size: FontSize.s20,
                    color: ColorManager.accentDarkYellow,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
