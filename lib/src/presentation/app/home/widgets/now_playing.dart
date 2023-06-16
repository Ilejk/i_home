import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:i_home/src/presentation/utils/managers/color_manager.dart';
import 'package:i_home/src/presentation/utils/managers/size_manager.dart';

class NowPlayingWidget extends StatelessWidget {
  const NowPlayingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(
            right: PaddingManager.p3.w,
          ),
          child: Container(
            height: SizeManager.s20.h,
            width: SizeManager.s2.w,
            color: ColorManager.white,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            right: PaddingManager.p3.w,
          ),
          child: Container(
            height: SizeManager.s10.h,
            width: SizeManager.s2.w,
            color: ColorManager.white,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            right: PaddingManager.p3.w,
          ),
          child: Container(
            height: SizeManager.s30.h,
            width: SizeManager.s2.w,
            color: ColorManager.white,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            right: PaddingManager.p3.w,
          ),
          child: Container(
            height: SizeManager.s15.h,
            width: SizeManager.s2.w,
            color: ColorManager.white,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            right: PaddingManager.p3.w,
          ),
          child: Container(
            height: SizeManager.s5.h,
            width: SizeManager.s2.w,
            color: ColorManager.white,
          ),
        ),
      ],
    );
  }
}
