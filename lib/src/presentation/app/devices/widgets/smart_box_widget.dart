import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/managers/color_manager.dart';
import '../../../utils/managers/font_manager.dart';
import '../../../utils/managers/size_manager.dart';
import '../../../widgets/app_textstyle_widget.dart';
import '../../../widgets/text_widget.dart';

class SmartBoxWidget extends StatelessWidget {
  const SmartBoxWidget({
    super.key,
    required this.name,
    required this.type,
    required this.image,
    required this.isOnValue,
    required this.onChaned,
  });
  final String name;
  final String type;
  final String image;
  final bool isOnValue;
  final void Function(bool)? onChaned;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(PaddingManager.p12),
      child: Container(
        height: SizeManager.s150.h,
        width: SizeManager.s100.w,
        decoration: BoxDecoration(
          color: ColorManager.secondaryDarkGrey,
          borderRadius: BorderRadius.circular(SizeManager.s20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: SizeManager.s80.h,
              child: Image.network(
                image,
                color: ColorManager.white,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: PaddingManager.p12.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(
                        text: name,
                        align: TextAlign.left,
                        style: appTextStyleWidget(
                          size: FontSize.s10,
                          color: ColorManager.white,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      SizedBox(
                        width: SizeManager.s80.w,
                        child: TextWidget(
                          maxLines: 2,
                          align: TextAlign.left,
                          text: type,
                          style: appTextStyleWidget(
                            size: FontSize.s10,
                            color: ColorManager.white54,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ],
                  ),
                  CupertinoSwitch(
                    activeColor: ColorManager.accentDarkYellow,
                    trackColor: ColorManager.accentDarkGrey,
                    value: isOnValue,
                    onChanged: onChaned,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
