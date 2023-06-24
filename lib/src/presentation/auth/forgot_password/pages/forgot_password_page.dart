import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:i_home/src/domain/auth/forgot_password_bloc/forgot_password_bloc.dart';
import 'package:i_home/src/domain/repo/forgot_password_repository.dart';
import 'package:i_home/src/presentation/utils/global/global_methods.dart';
import 'package:i_home/src/presentation/utils/managers/color_manager.dart';
import 'package:i_home/src/presentation/utils/managers/font_manager.dart';
import 'package:i_home/src/presentation/utils/managers/size_manager.dart';
import 'package:i_home/src/presentation/utils/managers/string_manager.dart';
import 'package:i_home/src/presentation/widgets/app_textstyle_widget.dart';
import 'package:i_home/src/presentation/widgets/spacers.dart';
import 'package:i_home/src/presentation/widgets/text_widget.dart';
import 'package:iconly/iconly.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ForgotPasswordBloc, ForgotPasswordState>(
      builder: (context, state) {
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
                    text: StringManager.forgotPWTitile,
                    style: appTextStyleWidget(
                      size: FontSize.s20,
                      color: ColorManager.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const HeightSpacer(iH: SizeManager.s20),
                  TextWidget(
                    maxLines: 2,
                    align: TextAlign.center,
                    text: StringManager.forgotPWSubtitle,
                    style: appTextStyleWidget(
                      size: FontSize.s17,
                      color: ColorManager.white,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  const HeightSpacer(iH: SizeManager.s20),
                  buildTextFieldWidget(
                    onTap: (value) {
                      context.read<ForgotPasswordBloc>().add(
                            ForgotPasswordEvent(value),
                          );
                    },
                    label: StringManager.emailCaps,
                    iconData: IconlyLight.message,
                  ),
                  const HeightSpacer(iH: SizeManager.s20),
                  resetPasswordButton(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  GestureDetector resetPasswordButton() {
    return GestureDetector(
      onTap: () => ForgotPasswordRepository(context).handlePasswordReset(
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
            text: StringManager.reset,
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
          autocorrect: false,
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
