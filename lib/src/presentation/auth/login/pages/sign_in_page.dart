import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:i_home/src/bloc/sign_in_bloc/sign_in_bloc.dart';
import 'package:i_home/src/domain/repo/sign_in_repository.dart';
import 'package:i_home/src/presentation/router/router.dart';
import 'package:i_home/src/presentation/utils/managers/asset_manager.dart';
import 'package:i_home/src/presentation/utils/managers/color_manager.dart';
import 'package:i_home/src/presentation/utils/managers/font_manager.dart';
import 'package:i_home/src/presentation/utils/managers/size_manager.dart';
import 'package:i_home/src/presentation/utils/managers/string_manager.dart';
import 'package:i_home/src/presentation/utils/global/global_methods.dart';
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
                  height: SizeManager.s500.h,
                  width: SizeManager.deviceWidth,
                  decoration: BoxDecoration(
                    color: ColorManager.primaryDarkGrey,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(SizeManager.s40),
                      topRight: Radius.circular(SizeManager.s40),
                    ),
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
                        buildTextFieldWidget(
                          label: StringManager.emailCaps,
                          iconData: IconlyLight.message,
                          onTap: (value) => context.read<SignInBloc>().add(
                                SignInEmailEvent(value),
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
                              _obscureText
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: ColorManager.accentDarkYellow,
                            ),
                          ),
                          onTap: (value) => context.read<SignInBloc>().add(
                                SignInPasswordEvent(value),
                              ),
                        ),
                        heightSpacer20(),
                        signInButton(),
                        heightSpacer20(),
                        forgotPasswordButton(),
                        heightSpacer20(),
                        goToRegisterPage(),
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
        text: StringManager.signInToCtn,
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
        text: StringManager.welcomeBack,
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

  GestureDetector signInButton() {
    return GestureDetector(
      onTap: () => SignInRepository(context: context).handleSignIn(
        () => GBM.pushAndReplaceNamed(
          context: context,
          routeName: Routes.mainRoute,
        ),
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
    );
  }

  Row forgotPasswordButton() {
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
          child: GestureDetector(
            onTap: () => GBM.pushNamed(
                context: context, routeName: Routes.forgotPasswordRoute),
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

  GestureDetector goToRegisterPage() {
    return GestureDetector(
      onTap: () =>
          GBM.pushNamed(context: context, routeName: Routes.registerRoute),
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
            text: StringManager.register,
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
