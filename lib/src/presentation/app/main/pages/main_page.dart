import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:i_home/src/bloc/bottom_bar_bloc/bottom_bar_bloc_bloc.dart';
import 'package:i_home/src/presentation/app/devices/pages/devices_page.dart';
import 'package:i_home/src/presentation/app/home/pages/home_page.dart';
import 'package:i_home/src/presentation/app/profile/pages/profile_page.dart';
import 'package:i_home/src/presentation/app/main/widgets/custom_painter.dart';
import 'package:i_home/src/presentation/app/modes/pages/modes_page.dart';
import 'package:i_home/src/presentation/router/router.dart';
import 'package:i_home/src/presentation/utils/managers/color_manager.dart';
import 'package:i_home/src/presentation/utils/managers/size_manager.dart';
import 'package:i_home/src/presentation/utils/global/global_methods.dart';
import 'package:iconly/iconly.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocBuilder<BottomBarBlocBloc, BottomBarBlocState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: ColorManager.primaryDarkGrey,
          body: Stack(
            children: [
              _getPageByIndex(state.selectedIndex),
              getBottomNavBar(size),
            ],
          ),
        );
      },
    );
  }

  Widget _getPageByIndex(int index) {
    switch (index) {
      case 0:
        return const HomePage();
      case 1:
        return const DevicesPage();
      case 2:
        return const ModesPage();
      case 3:
        return const ProfilePage();
      default:
        return Container();
    }
  }

  Positioned getBottomNavBar(Size size) {
    return Positioned(
      bottom: 0,
      left: 0,
      child: SizedBox(
        width: size.width,
        height: SizeManager.s70.h,
        child: Stack(
          children: [
            CustomPaint(
              painter: BNBCustomPainter(),
              size: Size(
                size.width,
                SizeManager.s70.h,
              ),
            ),
            bottomNavSpeakButton(),
            bottonNavigationBar(size)
          ],
        ),
      ),
    );
  }

  Color _getIconColor(int index) {
    var isPageSelected =
        context.read<BottomBarBlocBloc>().state.selectedIndex == index;
    return isPageSelected
        ? ColorManager.accentDarkYellow
        : ColorManager.white54;
  }

  SizedBox bottonNavigationBar(Size size) {
    int isHome = 0;
    int isDevices = 1;
    int isModes = 2;
    int isProfile = 3;
    return SizedBox(
      width: size.width,
      height: SizeManager.s70.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            onPressed: () => changeNavBarPage(isHome),
            icon: Icon(
              IconlyLight.home,
              color: _getIconColor(isHome),
              size: SizeManager.s30,
            ),
          ),
          IconButton(
            onPressed: () => changeNavBarPage(isDevices),
            icon: Icon(
              Icons.phonelink_ring_rounded,
              color: _getIconColor(isDevices),
              size: SizeManager.s30,
            ),
          ),
          Container(
            width: size.width * 0.2,
          ),
          IconButton(
            onPressed: () => changeNavBarPage(isModes),
            icon: Icon(
              Icons.settings_backup_restore_rounded,
              color: _getIconColor(isModes),
              size: SizeManager.s30,
            ),
          ),
          IconButton(
            onPressed: () => changeNavBarPage(isProfile),
            icon: Icon(
              IconlyLight.profile,
              color: _getIconColor(isProfile),
              size: SizeManager.s30,
            ),
          ),
        ],
      ),
    );
  }

  void changeNavBarPage(int index) {
    context.read<BottomBarBlocBloc>().state.selectedIndex = index;
    context.read<BottomBarBlocBloc>().add(BottomBarBlocEvent());
  }

  Center bottomNavSpeakButton() {
    return Center(
      heightFactor: 0.5,
      child: GestureDetector(
        onTap: () =>
            GBM.pushNamed(context: context, routeName: Routes.speakRoute),
        child: Container(
          height: SizeManager.s70.h,
          width: SizeManager.s70.h,
          decoration: BoxDecoration(
            color: ColorManager.accentDarkYellow,
            borderRadius: BorderRadius.circular(SizeManager.s40),
            boxShadow: [
              BoxShadow(
                color: ColorManager.accentLightYellow,
                spreadRadius: 1,
                blurRadius: 2,
                offset: const Offset(0.5, 0.5),
              ),
              BoxShadow(
                color: ColorManager.accentLightYellow,
                spreadRadius: 1,
                blurRadius: 2,
                offset: const Offset(-0.5, -0.5),
              )
            ],
          ),
          child: Icon(
            CupertinoIcons.mic_fill,
            color: ColorManager.primaryDarkGrey,
            size: SizeManager.s30,
          ),
        ),
      ),
    );
  }
}
