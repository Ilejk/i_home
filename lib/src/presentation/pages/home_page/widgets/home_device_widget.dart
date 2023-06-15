import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:i_home/src/presentation/utils/managers/color_manager.dart';
import 'package:i_home/src/presentation/utils/managers/font_manager.dart';
import 'package:i_home/src/presentation/utils/managers/size_manager.dart';
import 'package:i_home/src/presentation/widgets/app_textstyle_widget.dart';
import 'package:i_home/src/presentation/widgets/spacers.dart';
import 'package:i_home/src/presentation/widgets/text_widget.dart';

class HomeDeviceWidget extends StatelessWidget {
  const HomeDeviceWidget({
    super.key,
    required this.deviceType,
    required this.deviceName,
    required this.deviceIcon,
    required this.onChanged,
    required this.switchValue,
  });
  final String deviceType;
  final String deviceName;
  final String deviceIcon;
  final Function(bool)? onChanged;
  final bool switchValue;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: PaddingManager.p12.h,
        right: PaddingManager.p12.w,
      ),
      child: Container(
        height: SizeManager.s150.h,
        width: SizeManager.s170.w,
        decoration: BoxDecoration(
          color: ColorManager.secondaryDarkGrey,
          borderRadius: BorderRadius.circular(SizeManager.s20),
        ),
        child: Padding(
          padding: EdgeInsets.all(PaddingManager.p12.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: SizeManager.s30.h,
                    width: SizeManager.s30.w,
                    child: Image.asset(
                      deviceIcon,
                      color: ColorManager.white,
                    ),
                  ),
                  CupertinoSwitch(
                    activeColor: ColorManager.accentDarkYellow,
                    trackColor: ColorManager.accentDarkGrey,
                    value: switchValue,
                    onChanged: onChanged,
                  ),
                ],
              ),
              const HeightSpacer(iH: SizeManager.s15),
              TextWidget(
                text: deviceType,
                style: appTextStyleWidget(
                  size: FontSize.s12,
                  color: ColorManager.white54,
                  fontWeight: FontWeight.normal,
                ),
              ),
              TextWidget(
                text: deviceName,
                maxLines: 2,
                style: appTextStyleWidget(
                  size: FontSize.s15,
                  color: ColorManager.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
