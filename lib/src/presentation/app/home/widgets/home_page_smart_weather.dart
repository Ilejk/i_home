import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:i_home/src/presentation/utils/managers/asset_manager.dart';
import 'package:i_home/src/presentation/utils/managers/color_manager.dart';
import 'package:i_home/src/presentation/utils/managers/size_manager.dart';

class HomePageSmartWeather extends StatelessWidget {
  const HomePageSmartWeather({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeManager.deviceWidth,
      height: SizeManager.s60.h,
      decoration: BoxDecoration(
        color: ColorManager.secondaryDarkGrey,
        borderRadius: BorderRadius.circular(SizeManager.s40),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(SizeManager.s40),
        child: Image.asset(
          ImageManager.wCloudy,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
