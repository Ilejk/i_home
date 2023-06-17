import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:i_home/src/bloc/change_password/change_password_bloc.dart';
import 'package:i_home/src/domain/repo/settings_repository.dart';
import 'package:i_home/src/presentation/utils/global/global_methods.dart';
import 'package:iconly/iconly.dart';

import '../../../../../../../../../utils/managers/color_manager.dart';
import '../../../../../../../../../utils/managers/font_manager.dart';
import '../../../../../../../../../utils/managers/size_manager.dart';
import '../../../../../../../../../utils/managers/string_manager.dart';
import '../../../../../../../../../widgets/app_textstyle_widget.dart';
import '../../../../../../../../../widgets/spacers.dart';
import '../../../../../../../../../widgets/text_widget.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primaryDarkGrey,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: ColorManager.primaryDarkGrey,
      ),
      body: SafeArea(
        child: SizedBox(
          width: SizeManager.deviceWidth,
          height: SizeManager.deviceHeight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextWidget(
                align: TextAlign.center,
                text: StringManager.changePW,
                style: appTextStyleWidget(
                  size: FontSize.s20,
                  color: ColorManager.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const HeightSpacer(iH: SizeManager.s20),
              buildTextFieldWidget(
                onTap: (value) => context
                    .read<ChangePasswordBloc>()
                    .add(ChangePasswordOldPasswordEvent(value)),
                label: StringManager.oldPWCaps,
                iconData: IconlyLight.lock,
                iconButton: IconButton(
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                  icon: Icon(
                    _obscureText ? Icons.visibility : Icons.visibility_off,
                    color: ColorManager.accentDarkYellow,
                  ),
                ),
              ),
              buildTextFieldWidget(
                onTap: (value) => context
                    .read<ChangePasswordBloc>()
                    .add(ChangePasswordNewPasswordEvent(value)),
                label: StringManager.newPWCaps,
                iconData: IconlyLight.lock,
                iconButton: IconButton(
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                  icon: Icon(
                    _obscureText ? Icons.visibility : Icons.visibility_off,
                    color: ColorManager.accentDarkYellow,
                  ),
                ),
              ),
              const HeightSpacer(iH: SizeManager.s20),
              changePasswordButton(),
            ],
          ),
        ),
      ),
    );
  }

  GestureDetector changePasswordButton() {
    return GestureDetector(
      onTap: () => SettingsRepository(context).handleChanePassword(
        () => GBM.pop(context: context),
      ),
      child: Container(
        width: SizeManager.s345.w,
        height: SizeManager.s50.h,
        decoration: BoxDecoration(
          color: ColorManager.accentDarkYellow,
          borderRadius: BorderRadius.circular(
            SizeManager.s15.w,
          ),
        ),
        child: Center(
          child: TextWidget(
            text: StringManager.changePW,
            style: appTextStyleWidget(
              letterSpacing: SizeManager.s2,
              size: FontSize.s20,
              color: ColorManager.primaryDarkGrey,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }

  Padding buildTextFieldWidget({
    required Function(String)? onTap,
    required String? label,
    required IconData? iconData,
    IconButton? iconButton,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: PaddingManager.p12.h),
      child: SizedBox(
        height: SizeManager.s50.h,
        width: SizeManager.s345.w,
        child: TextField(
          obscureText: _obscureText,
          keyboardType: TextInputType.emailAddress,
          onChanged: onTap,
          style: appTextStyleWidget(
            size: FontSize.s20,
            color: ColorManager.white,
            fontWeight: FontWeight.normal,
          ),
          cursorHeight: SizeManager.s25.h,
          cursorColor: ColorManager.accentDarkYellow,
          decoration: InputDecoration(
            suffix: iconButton,
            prefix: Icon(
              iconData,
              color: ColorManager.accentDarkYellow,
            ),
            labelText: label,
            labelStyle: appTextStyleWidget(
              size: FontSize.s15,
              letterSpacing: SizeManager.s2,
              color: ColorManager.white,
              fontWeight: FontWeight.normal,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(SizeManager.s15),
              borderSide: BorderSide(
                color: ColorManager.accentDarkYellow,
                width: SizeManager.s2_5.w,
              ),
            ),
            focusColor: ColorManager.accentDarkYellow,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(SizeManager.s15),
              borderSide: BorderSide(
                color: ColorManager.accentDarkYellow,
                width: SizeManager.s2_5.w,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
