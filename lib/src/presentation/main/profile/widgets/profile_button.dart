import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:i_home/src/presentation/utils/managers/color_manager.dart';
import 'package:i_home/src/presentation/utils/managers/font_manager.dart';
import 'package:i_home/src/presentation/utils/managers/size_manager.dart';
import 'package:i_home/src/presentation/widgets/app_textstyle_widget.dart';
import 'package:i_home/src/presentation/widgets/spacers.dart';
import 'package:i_home/src/presentation/widgets/text_widget.dart';

class ProfileButton extends StatelessWidget {
  const ProfileButton({
    super.key,
    required this.title,
    required this.onTap,
    required this.ic,
  });
  final String title;
  final VoidCallback onTap;
  final IconData ic;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: PaddingManager.p12.h),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: SizeManager.deviceWidth,
          height: SizeManager.s60.h,
          decoration: BoxDecoration(
            color: ColorManager.primaryDarkGrey,
            borderRadius: BorderRadius.circular(SizeManager.s20),
            border: Border.all(
              color: ColorManager.accentDarkYellow,
              width: SizeManager.s1.w,
            ),
          ),
          child: Row(
            children: [
              Container(
                height: SizeManager.s60.h,
                width: SizeManager.s60.w,
                decoration: BoxDecoration(
                  color: ColorManager.accentDarkYellow,
                  borderRadius: BorderRadius.circular(
                    SizeManager.s20,
                  ),
                ),
                child: Center(
                  child: Icon(
                    ic,
                    size: SizeManager.s25,
                    color: ColorManager.primaryDarkGrey,
                  ),
                ),
              ),
              const WidthSpacer(iW: SizeManager.s20),
              TextWidget(
                text: title,
                style: appTextStyleWidget(
                  size: FontSize.s20,
                  color: ColorManager.white,
                  fontWeight: FontWeight.normal,
                  letterSpacing: SizeManager.s1,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
