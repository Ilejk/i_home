import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:i_home/src/presentation/pages/devices_page/devices_page.dart';
import 'package:i_home/src/presentation/pages/home_page/home_page.dart';
import 'package:i_home/src/presentation/pages/modes_page/modes_page.dart';
import 'package:i_home/src/presentation/pages/schedule_page/schedule_page.dart';
import 'package:i_home/src/presentation/utils/managers/color_manager.dart';
import 'package:i_home/src/presentation/utils/managers/size_manager.dart';
import 'package:iconly/iconly.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  final List _pages = const [
    HomePage(),
    DevicesPage(),
    ModesPage(),
    SchedulePage(),
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    var getBodyScreen = _pages[_selectedIndex];
    return Scaffold(
      backgroundColor: ColorManager.primaryDarkGrey,
      body: Stack(
        children: [
          getBodyScreen,
          getBottomNavBar(size),
        ],
      ),
    );
  }

  Positioned getBottomNavBar(Size size) {
    var isSchedulePage = _selectedIndex == 3;
    var isModesPage = _selectedIndex == 2;
    var isDevicesPage = _selectedIndex == 1;
    var isHomePage = _selectedIndex == 0;
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
            Center(
              heightFactor: 0.5,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    //TODO;
                  });
                },
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
            ),
            SizedBox(
              width: size.width,
              height: SizeManager.s70.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        _selectedIndex = 0;
                      });
                    },
                    icon: Icon(
                      IconlyLight.home,
                      color: isHomePage
                          ? ColorManager.accentDarkYellow
                          : ColorManager.white54,
                      size: SizeManager.s30,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        _selectedIndex = 1;
                      });
                    },
                    icon: Icon(
                      Icons.phonelink_ring_rounded,
                      color: isDevicesPage
                          ? ColorManager.accentDarkYellow
                          : ColorManager.white54,
                      size: SizeManager.s30,
                    ),
                  ),
                  Container(
                    width: size.width * 0.2,
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        _selectedIndex = 2;
                      });
                    },
                    icon: Icon(
                      Icons.settings_backup_restore_rounded,
                      color: isModesPage
                          ? ColorManager.accentDarkYellow
                          : ColorManager.white54,
                      size: SizeManager.s30,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        _selectedIndex = 3;
                      });
                    },
                    icon: Icon(
                      IconlyLight.calendar,
                      color: isSchedulePage
                          ? ColorManager.accentDarkYellow
                          : ColorManager.white54,
                      size: SizeManager.s30,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class BNBCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = ColorManager.secondaryDarkGrey
      ..style = PaintingStyle.fill;
    Path path = Path()..moveTo(0, 5);
    path.quadraticBezierTo(size.width * 0.20, 0, size.width * 0.35, 0);
    path.quadraticBezierTo(size.width * 0.40, 0, size.width * 0.40, 20);
    path.arcToPoint(
      Offset(size.width * 0.60, 20),
      radius: const Radius.circular(SizeManager.s10),
      clockwise: false,
    );
    path.quadraticBezierTo(size.width * 0.60, 0, size.width * 0.65, 0);
    path.quadraticBezierTo(size.width * 0.80, 0, size.width, 5);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
