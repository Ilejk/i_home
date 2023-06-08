import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:i_home/src/presentation/utils/color_manager.dart';
import 'package:i_home/src/presentation/utils/font_manager.dart';
import 'package:i_home/src/presentation/utils/size_manager.dart';
import 'package:i_home/src/presentation/widgets/app_textstyle_widget.dart';
import 'package:i_home/src/presentation/widgets/text_widget.dart';

class BoardingPage extends StatefulWidget {
  const BoardingPage({super.key});

  @override
  State<BoardingPage> createState() => _BoardingPageState();
}

class _BoardingPageState extends State<BoardingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primaryDarkGrey,
      body: SizedBox(
        width: SizeManager.deviceWidth,
        child: Stack(
          children: [
            PageView(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: SizeManager.s345.w,
                      width: SizeManager.s345.w,
                      child: Text('IMAGE 1'),
                    ),
                    TextWidget(
                      text: 'text 1',
                      style: appTextStyleWidget(
                        size: FontSize.s40.sp,
                        color: ColorManager.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextWidget(
                      text: 'subtext  1',
                      style: appTextStyleWidget(
                        size: FontSize.s25.sp,
                        color: ColorManager.white54,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
