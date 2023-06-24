import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../utils/managers/color_manager.dart';
import '../../../../../utils/managers/font_manager.dart';
import '../../../../../utils/managers/size_manager.dart';
import '../../../../../widgets/app_textstyle_widget.dart';
import '../../../../../widgets/text_widget.dart';

class LightModeWidget extends StatelessWidget {
  const LightModeWidget({
    super.key,
    required this.onTap,
    required this.modeName,
    required this.modePercentage,
    required this.isSelected,
  });
  final VoidCallback onTap;
  final String modeName;
  final String modePercentage;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: SizeManager.s100.h,
        width: SizeManager.s100.w,
        decoration: BoxDecoration(
          color: ColorManager.accentDarkGrey,
          borderRadius: BorderRadius.circular(SizeManager.s20),
          border: Border.all(
            color: isSelected
                ? ColorManager.accentDarkYellow
                : ColorManager.accentDarkGrey,
            width: SizeManager.s3,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextWidget(
              text: modeName,
              maxLines: 2,
              align: TextAlign.center,
              style: appTextStyleWidget(
                size: FontSize.s17,
                color: isSelected
                    ? ColorManager.accentDarkYellow
                    : ColorManager.white,
                fontWeight: FontWeight.normal,
              ),
            ),
            TextWidget(
              text: modePercentage,
              maxLines: 2,
              align: TextAlign.center,
              style: appTextStyleWidget(
                size: FontSize.s15,
                color: isSelected
                    ? ColorManager.accentDarkYellow
                    : ColorManager.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
