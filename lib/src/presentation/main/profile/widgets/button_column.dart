import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:i_home/src/presentation/main/profile/widgets/profile_button.dart';
import 'package:i_home/src/presentation/router/router.dart';
import 'package:i_home/src/presentation/utils/global/global_methods.dart';
import 'package:i_home/src/presentation/utils/managers/string_manager.dart';
import 'package:iconly/iconly.dart';

class ProfileButtonColumn extends StatelessWidget {
  const ProfileButtonColumn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfileButton(
          ic: IconlyBold.setting,
          title: StringManager.settings,
          onTap: () =>
              GBM.pushNamed(context: context, routeName: Routes.settingsRoute),
        ),
        ProfileButton(
          ic: CupertinoIcons.creditcard_fill,
          title: StringManager.paymentMeth,
          onTap: () =>
              GBM.pushNamed(context: context, routeName: Routes.paymentRoute),
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
          onTap: () =>
              GBM.pushNamed(context: context, routeName: Routes.helpRoute),
        ),
      ],
    );
  }
}
