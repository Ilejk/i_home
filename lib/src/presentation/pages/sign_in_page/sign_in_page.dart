import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
                    const HeightSpacer(iH: SizeManager.s20),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: TextWidget(
                        text: _isLogin
                            ? StringManager.welcomeBack
                            : StringManager.createAcc,
                        style: appTextStyleWidget(
                          size: FontSize.s30,
                          color: ColorManager.white,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: TextWidget(
                        text: _isLogin
                            ? StringManager.signInToCtn
                            : StringManager.startNow,
                        style: appTextStyleWidget(
                          size: FontSize.s15,
                          color: ColorManager.white54,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                    const HeightSpacer(iH: SizeManager.s20),
                    _isLogin
                        ? Container()
                        : Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: PaddingManager.p12.h),
                            child: SizedBox(
                              height: SizeManager.s50.h,
                              width: SizeManager.s345.w,
                              child: TextField(
                                style: appTextStyleWidget(
                                  size: FontSize.s20,
                                  color: ColorManager.white,
                                  fontWeight: FontWeight.normal,
                                ),
                                cursorHeight: SizeManager.s25.h,
                                cursorColor: ColorManager.accentDarkYellow,
                                decoration: InputDecoration(
                                  prefix: Icon(
                                    IconlyLight.profile,
                                    color: ColorManager.accentDarkYellow,
                                  ),
                                  labelText: StringManager.nameCaps,
                                  labelStyle: appTextStyleWidget(
                                    size: FontSize.s15,
                                    letterSpacing: SizeManager.s2,
                                    color: ColorManager.white,
                                    fontWeight: FontWeight.normal,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.circular(SizeManager.s15),
                                    borderSide: BorderSide(
                                      color: ColorManager.accentDarkYellow,
                                      width: SizeManager.s2_5.w,
                                    ),
                                  ),
                                  focusColor: ColorManager.accentDarkYellow,
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.circular(SizeManager.s15),
                                    borderSide: BorderSide(
                                      color: ColorManager.accentDarkYellow,
                                      width: SizeManager.s2_5.w,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: PaddingManager.p12.h),
                      child: SizedBox(
                        height: SizeManager.s50.h,
                        width: SizeManager.s345.w,
                        child: TextField(
                          keyboardType: TextInputType.emailAddress,
                          style: appTextStyleWidget(
                            size: FontSize.s20,
                            color: ColorManager.white,
                            fontWeight: FontWeight.normal,
                          ),
                          cursorHeight: SizeManager.s25.h,
                          cursorColor: ColorManager.accentDarkYellow,
                          decoration: InputDecoration(
                            prefix: Icon(
                              IconlyLight.message,
                              color: ColorManager.accentDarkYellow,
                            ),
                            labelText: StringManager.emailCaps,
                            labelStyle: appTextStyleWidget(
                              size: FontSize.s15,
                              letterSpacing: SizeManager.s2,
                              color: ColorManager.white,
                              fontWeight: FontWeight.normal,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(SizeManager.s15),
                              borderSide: BorderSide(
                                color: ColorManager.accentDarkYellow,
                                width: SizeManager.s2_5.w,
                              ),
                            ),
                            focusColor: ColorManager.accentDarkYellow,
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(SizeManager.s15),
                              borderSide: BorderSide(
                                color: ColorManager.accentDarkYellow,
                                width: SizeManager.s2_5.w,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: PaddingManager.p12.h),
                      child: SizedBox(
                        height: SizeManager.s50.h,
                        width: SizeManager.s345.w,
                        child: TextField(
                          obscureText: _obscureText,
                          style: appTextStyleWidget(
                            size: FontSize.s20,
                            color: ColorManager.white,
                            fontWeight: FontWeight.normal,
                          ),
                          cursorHeight: SizeManager.s25.h,
                          cursorColor: ColorManager.accentDarkYellow,
                          decoration: InputDecoration(
                            suffix: IconButton(
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
                            prefix: Icon(
                              IconlyLight.lock,
                              color: ColorManager.accentDarkYellow,
                            ),
                            labelText: StringManager.passwordCaps,
                            labelStyle: appTextStyleWidget(
                              size: FontSize.s15,
                              letterSpacing: SizeManager.s2,
                              color: ColorManager.white,
                              fontWeight: FontWeight.normal,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(SizeManager.s15),
                              borderSide: BorderSide(
                                color: ColorManager.accentDarkYellow,
                                width: SizeManager.s2_5.w,
                              ),
                            ),
                            focusColor: ColorManager.accentDarkYellow,
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(SizeManager.s15),
                              borderSide: BorderSide(
                                color: ColorManager.accentDarkYellow,
                                width: SizeManager.s2_5.w,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const HeightSpacer(iH: SizeManager.s25),
                    GestureDetector(
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
                            text: StringManager.signIn,
                            style: appTextStyleWidget(
                              letterSpacing: SizeManager.s2,
                              size: FontSize.s20,
                              color: ColorManager.primaryDarkGrey,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const HeightSpacer(iH: SizeManager.s20),
                    Row(
                      children: [
                        Expanded(
                          child: Divider(
                            color: ColorManager.accentDarkYellow,
                            height: SizeManager.s1.h,
                          ),
                        ),
                        _isLogin
                            ? Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: PaddingManager.p5.w),
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
                                padding: EdgeInsets.symmetric(
                                    horizontal: PaddingManager.p5.w),
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
                    ),
                    const HeightSpacer(iH: SizeManager.s20),
                    GestureDetector(
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
                            text: _isLogin
                                ? StringManager.signUp
                                : StringManager.signIn,
                            style: appTextStyleWidget(
                              letterSpacing: SizeManager.s2,
                              size: FontSize.s20,
                              color: ColorManager.accentDarkYellow,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
