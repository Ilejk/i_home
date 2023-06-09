import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:i_home/src/app/sign_in_bloc/sign_in_bloc.dart';
import 'package:i_home/src/presentation/utils/managers/asset_manager.dart';
import 'package:i_home/src/presentation/utils/managers/color_manager.dart';
import 'package:i_home/src/presentation/utils/managers/font_manager.dart';
import 'package:i_home/src/presentation/utils/managers/size_manager.dart';
import 'package:i_home/src/presentation/utils/managers/string_manager.dart';
import 'package:i_home/src/presentation/widgets/app_textstyle_widget.dart';
import 'package:i_home/src/presentation/widgets/spacers.dart';
import 'package:i_home/src/presentation/widgets/text_widget.dart';
import 'package:iconly/iconly.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool _obscureText = true;
  bool _isLogin = true;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc, SignInState>(
      builder: (context, state) {
        return Scaffold(
          body: Stack(
            children: [
              Image.asset(
                ImageManager.signInBackGround,
                fit: BoxFit.fill,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: _isLogin ? SizeManager.s500.h : SizeManager.s600.h,
                  width: SizeManager.deviceWidth,
                  decoration: BoxDecoration(
                    color: ColorManager.primaryDarkGrey,
                    borderRadius: BorderRadius.circular(SizeManager.s40),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: PaddingManager.p24.h,
                      horizontal: PaddingManager.p12.w,
                    ),
                    child: Column(
                      children: [
                        heightSpacer20(),
                        signInPageTitle(),
                        signInPageSubtitle(),
                        heightSpacer20(),
                        _isLogin
                            ? Container()
                            : buildTextFieldWidget(
                                label: StringManager.nameCaps,
                                iconData: IconlyLight.profile,
                                onTap: (value) =>
                                    context.read<SignInBloc>().add(
                                          NameEvent(value),
                                        ),
                              ),
                        buildTextFieldWidget(
                          label: StringManager.emailCaps,
                          iconData: IconlyLight.message,
                          onTap: (value) => context.read<SignInBloc>().add(
                                EmailEvent(value),
                              ),
                        ),
                        buildTextFieldWidget(
                          label: StringManager.passwordCaps,
                          iconData: IconlyLight.lock,
                          iconButton: IconButton(
                            onPressed: () {
                              setState(() {
                                _obscureText = !_obscureText;
                              });
                            },
                            icon: Icon(
                              _obscureText
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: ColorManager.accentDarkYellow,
                            ),
                          ),
                          onTap: (value) => context.read<SignInBloc>().add(
                                PasswordEvent(value),
                              ),
                        ),
                        heightSpacer20(),
                        signInOrSinUpButton(),
                        heightSpacer20(),
                        forgotPasswordButtonOrSpacer(),
                        heightSpacer20(),
                        changeSignInViewButton(),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  HeightSpacer heightSpacer20() => const HeightSpacer(iH: SizeManager.s20);

  Align signInPageSubtitle() {
    return Align(
      alignment: Alignment.centerLeft,
      child: TextWidget(
        text: _isLogin ? StringManager.signInToCtn : StringManager.startNow,
        style: appTextStyleWidget(
          size: FontSize.s15,
          color: ColorManager.white54,
          fontWeight: FontWeight.normal,
        ),
      ),
    );
  }

  Align signInPageTitle() {
    return Align(
      alignment: Alignment.centerLeft,
      child: TextWidget(
        text: _isLogin ? StringManager.welcomeBack : StringManager.createAcc,
        style: appTextStyleWidget(
          size: FontSize.s30,
          color: ColorManager.white,
          fontWeight: FontWeight.normal,
        ),
      ),
    );
  }

  Padding buildTextFieldWidget(
      {required Function(String)? onTap,
      required String? label,
      required IconData? iconData,
      IconButton? iconButton}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: PaddingManager.p12.h),
      child: SizedBox(
        height: SizeManager.s50.h,
        width: SizeManager.s345.w,
        child: TextField(
          obscureText: _obscureText,
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

  GestureDetector signInOrSinUpButton() {
    return GestureDetector(
      onTap: () {
        //TODO
      },
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
            text: _isLogin ? StringManager.signIn : StringManager.signUp,
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

  Row forgotPasswordButtonOrSpacer() {
    return Row(
      children: [
        Expanded(
          child: Divider(
            color: ColorManager.accentDarkYellow,
            height: SizeManager.s1.h,
          ),
        ),
        _isLogin
            ? Padding(
                padding: EdgeInsets.symmetric(horizontal: PaddingManager.p5.w),
                child: GestureDetector(
                  onTap: () {
                    //TODO
                  },
                  child: TextWidget(
                    text: StringManager.forgotPW,
                    style: appTextStyleWidget(
                      size: FontSize.s12,
                      color: ColorManager.white54,
                      fontWeight: FontWeight.normal,
                      letterSpacing: SizeManager.s2,
                    ),
                  ),
                ),
              )
            : Padding(
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

  GestureDetector changeSignInViewButton() {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isLogin = !_isLogin;
        });
      },
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
            text: _isLogin ? StringManager.signUp : StringManager.signIn,
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
