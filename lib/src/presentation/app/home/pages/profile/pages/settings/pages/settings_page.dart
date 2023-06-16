import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:i_home/src/bloc/settings_bloc/settings_bloc.dart';
import 'package:i_home/src/presentation/app/home/pages/profile/pages/settings/widgets/settings_button.dart';
import 'package:i_home/src/presentation/app/home/pages/profile/pages/settings/widgets/title_spacer.dart';
import 'package:i_home/src/presentation/router/router.dart';
import 'package:i_home/src/presentation/utils/constnants/constants.dart';
import 'package:i_home/src/presentation/utils/global/global_methods.dart';
import 'package:i_home/src/presentation/utils/managers/color_manager.dart';
import 'package:i_home/src/presentation/utils/managers/font_manager.dart';
import 'package:i_home/src/presentation/utils/managers/size_manager.dart';
import 'package:i_home/src/presentation/utils/managers/string_manager.dart';
import 'package:i_home/src/presentation/widgets/app_textstyle_widget.dart';
import 'package:i_home/src/presentation/widgets/spacers.dart';
import 'package:i_home/src/presentation/widgets/text_widget.dart';
import 'package:iconly/iconly.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: ColorManager.primaryDarkGrey,
          appBar: AppBar(
            elevation: 0.0,
            backgroundColor: ColorManager.primaryDarkGrey,
            title: TextWidget(
              text: StringManager.settings,
              style: appTextStyleWidget(
                size: FontSize.s20,
                color: ColorManager.white,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: PaddingManager.p12.h,
                horizontal: PaddingManager.p24.w,
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const TitleSpacer(
                      ic: IconlyBold.profile,
                      title: StringManager.account,
                    ),
                    SettingsButton(
                      title: StringManager.editAcc,
                      onTap: () {
                        //TODO
                      },
                    ),
                    SettingsButton(
                      title: StringManager.changePW,
                      onTap: () {
                        //TODO
                      },
                    ),
                    SettingsButton(
                      title: StringManager.security,
                      onTap: () {
                        //TODO
                      },
                    ),
                    const HeightSpacer(iH: SizeManager.s20),
                    const TitleSpacer(
                      ic: CupertinoIcons.bell_fill,
                      title: StringManager.notification,
                    ),
                    SettingsButton(
                      title: StringManager.notification,
                      onTap: () {
                        //TODO
                      },
                    ),
                    SettingsButton(
                      title: StringManager.appNotification,
                      onTap: () {
                        //TODO
                      },
                    ),
                    const HeightSpacer(iH: SizeManager.s20),
                    const TitleSpacer(
                      ic: Icons.menu,
                      title: StringManager.more,
                    ),
                    SettingsButton(
                      title: StringManager.language,
                      onTap: () {
                        //TODO
                      },
                    ),
                    SettingsButton(
                      title: StringManager.country,
                      onTap: () {
                        //TODO
                      },
                    ),
                    const HeightSpacer(iH: SizeManager.s20),
                    SizedBox(
                      width: SizeManager.s200.w,
                      child: Divider(
                        color: ColorManager.accentDarkYellow,
                        height: SizeManager.s10,
                        thickness: SizeManager.s1,
                      ),
                    ),
                    SettingsButton(
                      title: StringManager.logout,
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              actionsAlignment: MainAxisAlignment.center,
                              backgroundColor: ColorManager.primaryDarkGrey,
                              title: TextWidget(
                                text: StringManager.uSure,
                                align: TextAlign.center,
                                style: appTextStyleWidget(
                                  size: FontSize.s20,
                                  color: ColorManager.white,
                                  letterSpacing: SizeManager.s1,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () => GBM.pop(context: context),
                                  child: TextWidget(
                                    text: StringManager.cancel,
                                    style: appTextStyleWidget(
                                      size: FontSize.s15,
                                      color: ColorManager.accentDarkYellow,
                                      letterSpacing: SizeManager.s1,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () => _logOut(context),
                                  child: TextWidget(
                                    text: StringManager.logout,
                                    style: appTextStyleWidget(
                                      size: FontSize.s15,
                                      color: ColorManager.white,
                                      letterSpacing: SizeManager.s1,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void _logOut(BuildContext context) {
    GBM.storageService.remove(AppConst.STORAGE_USER_TOKEN_KEY);
    GBM.pushAndReplaceNamed(context: context, routeName: Routes.signInRoute);
  }
}
