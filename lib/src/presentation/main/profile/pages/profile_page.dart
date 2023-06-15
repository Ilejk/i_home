import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:i_home/src/presentation/main/profile/widgets/profile_button.dart';
import 'package:i_home/src/presentation/main/profile/widgets/welcome_widget.dart';
import 'package:i_home/src/presentation/router/router.dart';
import 'package:i_home/src/presentation/utils/global/global_methods.dart';
import 'package:i_home/src/presentation/utils/managers/asset_manager.dart';
import 'package:i_home/src/presentation/utils/managers/color_manager.dart';
import 'package:i_home/src/presentation/utils/managers/font_manager.dart';
import 'package:i_home/src/presentation/utils/managers/size_manager.dart';
import 'package:i_home/src/presentation/utils/managers/string_manager.dart';
import 'package:i_home/src/presentation/widgets/app_textstyle_widget.dart';
import 'package:i_home/src/presentation/widgets/spacers.dart';
import 'package:i_home/src/presentation/widgets/text_widget.dart';
import 'package:iconly/iconly.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: ColorManager.primaryDarkGrey,
        title: TextWidget(
          text: StringManager.profile,
          style: appTextStyleWidget(
            size: FontSize.s20,
            color: ColorManager.white,
            fontWeight: FontWeight.normal,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              //TODO
            },
            icon: const Icon(
              Icons.more_vert_rounded,
              size: SizeManager.s25,
            ),
          )
        ],
      ),
      backgroundColor: ColorManager.primaryDarkGrey,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: PaddingManager.p12.w,
            vertical: PaddingManager.p24.h,
          ),
          child: Column(
            children: [
              const WelcomeWidget(),
              const HeightSpacer(iH: SizeManager.s20),
              Column(
                children: [
                  ProfileButton(
                    ic: IconlyBold.setting,
                    title: StringManager.settings,
                    onTap: () => GBM.pushNamed(
                        context: context, routeName: Routes.settingsRoute),
                  ),
                  ProfileButton(
                    ic: CupertinoIcons.creditcard_fill,
                    title: StringManager.paymentMeth,
                    onTap: () => GBM.pushNamed(
                        context: context, routeName: Routes.paymentRoute),
                  ),
                  ProfileButton(
                    ic: CupertinoIcons.bookmark_fill,
                    title: StringManager.achievement,
                    onTap: () => GBM.pushNamed(
                        context: context, routeName: Routes.achievementsRoute),
                  ),
                  ProfileButton(
                    ic: Icons.connected_tv,
                    title: StringManager.connections,
                    onTap: () => GBM.pushNamed(
                        context: context, routeName: Routes.connectionsRoute),
                  ),
                  ProfileButton(
                    ic: Icons.help_outline_rounded,
                    title: StringManager.help,
                    onTap: () => GBM.pushNamed(
                        context: context, routeName: Routes.helpRoute),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
