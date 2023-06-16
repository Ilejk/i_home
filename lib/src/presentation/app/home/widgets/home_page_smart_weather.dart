import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:i_home/src/presentation/router/router.dart';
import 'package:i_home/src/presentation/utils/global/global_methods.dart';
import 'package:i_home/src/presentation/utils/managers/color_manager.dart';
import 'package:i_home/src/presentation/utils/managers/size_manager.dart';
import 'package:iconly/iconly.dart';

class HomePageSmartWeather extends StatelessWidget {
  const HomePageSmartWeather({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () =>
              GBM.pushNamed(context: context, routeName: Routes.weatherRoute),
          child: Container(
            width: SizeManager.s150.w,
            height: SizeManager.s50.h,
            decoration: BoxDecoration(
              color: ColorManager.secondaryDarkGrey,
              borderRadius: BorderRadius.circular(SizeManager.s40),
            ),
            child: const Center(child: Text('TODO')), // TODO
          ),
        ),
        GestureDetector(
          onTap: () =>
              GBM.pushNamed(context: context, routeName: Routes.profileRoute),
          child: Container(
            height: SizeManager.s50.h,
            width: SizeManager.s50.w,
            decoration: BoxDecoration(
              color: ColorManager.secondaryDarkGrey,
              borderRadius: BorderRadius.circular(SizeManager.s60),
            ),
            child: const Icon(
              IconlyBold.profile,
              color: ColorManager.white,
            ),
          ),
        )
      ],
    );
  }
}
