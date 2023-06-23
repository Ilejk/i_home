import 'package:flutter/material.dart';
import 'package:i_home/src/presentation/utils/managers/color_manager.dart';
import 'package:i_home/src/presentation/utils/managers/font_manager.dart';
import 'package:i_home/src/presentation/utils/managers/size_manager.dart';
import 'package:i_home/src/presentation/widgets/app_textstyle_widget.dart';
import 'package:i_home/src/presentation/widgets/spacers.dart';
import 'package:i_home/src/presentation/widgets/text_widget.dart';

class TitleSpacer extends StatelessWidget {
  const TitleSpacer({
    super.key,
    required this.ic,
    required this.title,
  });
  final IconData ic;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Icon(
          ic,
          color: ColorManager.white,
          size: SizeManager.s30,
        ),
        const WidthSpacer(iW: SizeManager.s10),
        TextWidget(
          text: title,
          style: appTextStyleWidget(
            size: FontSize.s20,
            color: ColorManager.white,
            letterSpacing: SizeManager.s1,
            fontWeight: FontWeight.w600,
          ),
        )
      ],
    );
  }
}
