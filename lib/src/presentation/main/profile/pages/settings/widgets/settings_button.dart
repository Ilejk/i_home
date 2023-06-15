import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:i_home/src/presentation/utils/managers/color_manager.dart';
import 'package:i_home/src/presentation/utils/managers/font_manager.dart';
import 'package:i_home/src/presentation/utils/managers/size_manager.dart';
import 'package:i_home/src/presentation/widgets/app_textstyle_widget.dart';
import 'package:i_home/src/presentation/widgets/text_widget.dart';

class SettingsButton extends StatelessWidget {
  const SettingsButton({
    super.key,
    required this.title,
    required this.onTap,
  });
  final String title;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.only(top: PaddingManager.p12.h),
        child: Container(
          height: SizeManager.s50.h,
          width: SizeManager.deviceWidth,
          decoration: BoxDecoration(
            color: ColorManager.secondaryDarkGrey,
            borderRadius: BorderRadius.circular(SizeManager.s20),
            boxShadow: const [
              BoxShadow(
                offset: Offset(4, 4),
                color: ColorManager.black26,
                spreadRadius: 1,
                blurRadius: 1,
              )
            ],
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: PaddingManager.p12.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextWidget(
                  text: title,
                  style: appTextStyleWidget(
                    size: FontSize.s17,
                    color: ColorManager.white54,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                const Icon(
                  Icons.arrow_forward_ios_sharp,
                  color: ColorManager.white,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
