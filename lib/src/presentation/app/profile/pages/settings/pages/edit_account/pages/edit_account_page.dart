import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:i_home/src/bloc/edit_account_bloc/edit_account_bloc.dart';
import 'package:i_home/src/presentation/utils/constnants/constants.dart';
import 'package:iconly/iconly.dart';

import '../../../../../../../../domain/repo/settings_repository.dart';
import '../../../../../../../utils/global/global_methods.dart';
import '../../../../../../../utils/managers/color_manager.dart';
import '../../../../../../../utils/managers/font_manager.dart';
import '../../../../../../../utils/managers/size_manager.dart';
import '../../../../../../../utils/managers/string_manager.dart';
import '../../../../../../../widgets/app_textstyle_widget.dart';
import '../../../../../../../widgets/spacers.dart';
import '../../../../../../../widgets/text_widget.dart';

class EditAccountPage extends StatefulWidget {
  const EditAccountPage({super.key});

  @override
  State<EditAccountPage> createState() => _EditAccountPageState();
}

class _EditAccountPageState extends State<EditAccountPage> {
  String initialName = '';
  String initialEmail = '';
  late Future<void> userDataFuture;

  @override
  void initState() {
    super.initState();
    userDataFuture = loadUserData();
  }

  Future<void> loadUserData() async {
    final repository = SettingsRepository(context);
    initialName = await repository.getUserName();
    initialEmail = await repository.getEmail();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditAccountBloc, EditAccountState>(
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
              child: FutureBuilder<void>(
                future: userDataFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return GBM.spinkit;
                  }
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextWidget(
                        maxLines: 2,
                        align: TextAlign.center,
                        text: StringManager.updateAccInfo,
                        style: appTextStyleWidget(
                          size: FontSize.s20,
                          color: ColorManager.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const HeightSpacer(iH: SizeManager.s20),
                      Padding(
                        padding: EdgeInsets.only(left: PaddingManager.p24.w),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: TextWidget(
                            align: TextAlign.left,
                            text: StringManager.updateEmail,
                            style: appTextStyleWidget(
                              size: FontSize.s15,
                              color: ColorManager.white,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                      buildTextFieldWidget(
                        onTap: (value) => context.read<EditAccountBloc>().add(
                              EditAccountNewEmailEvent(value),
                            ),
                        label: StringManager.emailCaps,
                        iconData: IconlyLight.message,
                        initialValue: initialEmail,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: PaddingManager.p24.w),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: TextWidget(
                            align: TextAlign.left,
                            text: StringManager.updateUserName,
                            style: appTextStyleWidget(
                              size: FontSize.s15,
                              color: ColorManager.white,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                      buildTextFieldWidget(
                        onTap: (value) => context.read<EditAccountBloc>().add(
                              EditAccountNewNameEvent(value),
                            ),
                        label: StringManager.nameCaps,
                        iconData: IconlyLight.profile,
                        initialValue: initialName,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: PaddingManager.p24.w),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: TextWidget(
                            align: TextAlign.left,
                            text: StringManager.reAuthWithpass,
                            style: appTextStyleWidget(
                              size: FontSize.s15,
                              color: ColorManager.white,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                      buildTextFieldWidget(
                        onTap: (value) => context.read<EditAccountBloc>().add(
                              EditAccountPasswordEvent(value),
                            ),
                        label: StringManager.passwordCaps,
                        iconData: IconlyLight.lock,
                        initialValue: emptyString,
                        obscureText: true,
                      ),
                      const HeightSpacer(iH: SizeManager.s20),
                      updateInfoButton(),
                    ],
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }

  GestureDetector updateInfoButton() {
    return GestureDetector(
      onTap: () => SettingsRepository(context).handleEditAccount(
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
            text: StringManager.update,
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
    required String? initialValue,
    bool obscureText = false,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: PaddingManager.p12.h),
      child: SizedBox(
        height: SizeManager.s50.h,
        width: SizeManager.s345.w,
        child: TextFormField(
          obscureText: obscureText,
          initialValue: initialValue,
          autocorrect: false,
          onChanged: onTap,
          style: appTextStyleWidget(
            size: FontSize.s20,
            color: ColorManager.white,
            fontWeight: FontWeight.normal,
          ),
          cursorHeight: SizeManager.s25.h,
          cursorColor: ColorManager.accentDarkYellow,
          decoration: InputDecoration(
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
