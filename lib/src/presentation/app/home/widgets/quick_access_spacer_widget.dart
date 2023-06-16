import 'package:flutter/material.dart';
import 'package:i_home/src/presentation/utils/managers/color_manager.dart';
import 'package:i_home/src/presentation/utils/managers/font_manager.dart';
import 'package:i_home/src/presentation/utils/managers/size_manager.dart';
import 'package:i_home/src/presentation/utils/managers/string_manager.dart';
import 'package:i_home/src/presentation/widgets/app_textstyle_widget.dart';
import 'package:i_home/src/presentation/widgets/text_widget.dart';
import 'package:iconly/iconly.dart';

class QuickAccessSpacer extends StatelessWidget {
  const QuickAccessSpacer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextWidget(
          text: StringManager.quickAccess,
          style: appTextStyleWidget(
            size: FontSize.s17,
            color: ColorManager.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        TextWidget(
          text: StringManager.devices,
          style: appTextStyleWidget(
            size: FontSize.s15,
            color: ColorManager.accentDarkYellow,
            fontWeight: FontWeight.normal,
          ),
        ),
      ],
    );
  }
}
