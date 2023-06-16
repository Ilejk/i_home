import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:i_home/src/bloc/register_bloc/register_bloc.dart';
import 'package:i_home/src/domain/repo/register_repository.dart';
import 'package:i_home/src/presentation/utils/managers/color_manager.dart';
import 'package:i_home/src/presentation/utils/managers/font_manager.dart';
import 'package:i_home/src/presentation/utils/managers/size_manager.dart';
import 'package:i_home/src/presentation/utils/managers/string_manager.dart';
import 'package:i_home/src/presentation/utils/global/global_methods.dart';
import 'package:i_home/src/presentation/widgets/app_textstyle_widget.dart';
import 'package:i_home/src/presentation/widgets/spacers.dart';
import 'package:i_home/src/presentation/widgets/text_widget.dart';
import 'package:iconly/iconly.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: ColorManager.primaryDarkGrey,
          body: Padding(
            padding: EdgeInsets.symmetric(
              vertical: PaddingManager.p40.h,
              horizontal: PaddingManager.p12.w,
            ),
            child: Column(
              children: [
                heightSpacer20(),
                registerPageTitle(),
                registerPageSubTitle(),
                heightSpacer20(),
                buildTextFieldWidget(
                  isNotPassword: true,
                  label: StringManager.nameCaps,
                  iconData: IconlyLight.profile,
                  onTap: (value) => context.read<RegisterBloc>().add(
                        RegisterNameEvent(value),
                      ),
                ),
                buildTextFieldWidget(
                  label: StringManager.emailCaps,
                  iconData: IconlyLight.message,
                  onTap: (value) => context.read<RegisterBloc>().add(
                        RegisterEmailEvent(value),
                      ),
                  isNotPassword: true,
                ),
                buildTextFieldWidget(
                  label: StringManager.passwordCaps,
                  iconData: IconlyLight.lock,
                  isNotPassword: false,
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
                  onTap: (value) => context.read<RegisterBloc>().add(
                        RegisterPasswordEvent(value),
                      ),
                ),
                buildTextFieldWidget(
                  label: StringManager.confirmPW,
                  iconData: IconlyLight.lock,
                  isNotPassword: false,
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
                  onTap: (value) => context.read<RegisterBloc>().add(
                        RegisterConfirmPasswordEvent(value),
                      ),
                ),
                heightSpacer20(),
                registerButton(),
                heightSpacer20(),
                alreadyHaveAccSpacer(),
                heightSpacer20(),
                goBackToSignInPageButton(),
              ],
            ),
          ),
        );
      },
    );
  }

  HeightSpacer heightSpacer20() => const HeightSpacer(iH: SizeManager.s20);

  Align registerPageSubTitle() {
    return Align(
      alignment: Alignment.centerLeft,
      child: TextWidget(
        text: StringManager.startNow,
        style: appTextStyleWidget(
          size: FontSize.s15,
          color: ColorManager.white54,
          fontWeight: FontWeight.normal,
        ),
      ),
    );
  }

  Align registerPageTitle() {
    return Align(
      alignment: Alignment.centerLeft,
      child: TextWidget(
        text: StringManager.createAcc,
        style: appTextStyleWidget(
          size: FontSize.s30,
          color: ColorManager.white,
          fontWeight: FontWeight.normal,
        ),
      ),
    );
  }

  Padding buildTextFieldWidget({
    required Function(String)? onTap,
    required String? label,
    required IconData? iconData,
    IconButton? iconButton,
    required bool isNotPassword,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: PaddingManager.p12.h),
      child: SizedBox(
        height: SizeManager.s50.h,
        width: SizeManager.s345.w,
        child: TextField(
          obscureText: isNotPassword ? false : _obscureText,
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

  GestureDetector registerButton() {
    return GestureDetector(
      onTap: () => RegisterRepository(context: context).handleEmailRegister(
        GBM.pop(context: context),
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
            text: StringManager.register,
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

  Row alreadyHaveAccSpacer() {
    return Row(
      children: [
        Expanded(
          child: Divider(
            color: ColorManager.accentDarkYellow,
            height: SizeManager.s1.h,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: PaddingManager.p5.w),
          child: TextWidget(
            text: StringManager.alreadyHaverACC,
            style: appTextStyleWidget(
              size: FontSize.s12,
              color: ColorManager.white54,
              fontWeight: FontWeight.normal,
              letterSpacing: SizeManager.s2,
            ),
          ),
        ),
        Expanded(
          child: Divider(
            color: ColorManager.accentDarkYellow,
            height: SizeManager.s1.h,
          ),
        ),
      ],
    );
  }

  GestureDetector goBackToSignInPageButton() {
    return GestureDetector(
      onTap: () => GBM.pop(context: context),
      child: Container(
        width: SizeManager.s345.w,
        height: SizeManager.s50.h,
        decoration: BoxDecoration(
          color: ColorManager.primaryDarkGrey,
          borderRadius: BorderRadius.circular(
            SizeManager.s15.w,
          ),
          border: Border.all(
            color: ColorManager.accentDarkYellow,
            width: SizeManager.s2_5.w,
          ),
        ),
        child: Center(
          child: TextWidget(
            text: StringManager.signIn,
            style: appTextStyleWidget(
              letterSpacing: SizeManager.s2,
              size: FontSize.s20,
              color: ColorManager.accentDarkYellow,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }
}
