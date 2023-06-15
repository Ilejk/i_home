import 'package:flutter/material.dart';
import 'package:i_home/src/presentation/utils/managers/color_manager.dart';
import 'package:i_home/src/presentation/utils/managers/font_manager.dart';
import 'package:i_home/src/presentation/utils/managers/size_manager.dart';
import 'package:i_home/src/presentation/utils/managers/string_manager.dart';
import 'package:i_home/src/presentation/widgets/app_textstyle_widget.dart';
import 'package:i_home/src/presentation/widgets/text_widget.dart';
import 'package:iconly/iconly.dart';

class FavModsSpacer extends StatelessWidget {
  const FavModsSpacer({
    super.key,
    required this.onTap,
  });
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextWidget(
          text: StringManager.favMods,
          style: appTextStyleWidget(
            size: FontSize.s17,
            color: ColorManager.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        GestureDetector(
          onTap: onTap,
          child: Row(
            children: [
              TextWidget(
                text: StringManager.allModes,
                style: appTextStyleWidget(
                  size: FontSize.s15,
                  color: ColorManager.accentDarkYellow,
                  fontWeight: FontWeight.normal,
                ),
              ),
              Icon(
                IconlyLight.arrow_right_2,
                size: SizeManager.s20,
                color: ColorManager.accentDarkYellow,
              )
            ],
          ),
        ),
      ],
    );
  }
}
