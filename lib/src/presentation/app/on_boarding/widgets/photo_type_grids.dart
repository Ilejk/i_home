import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:i_home/src/presentation/utils/managers/color_manager.dart';
import 'package:i_home/src/presentation/utils/managers/size_manager.dart';

class PhotoGrid1 extends StatelessWidget {
  const PhotoGrid1({
    super.key,
    required this.imagePath1,
    required this.imagePath2,
    required this.imagePath3,
  });

  final String imagePath1;
  final String imagePath2;
  final String imagePath3;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeManager.s500.h,
      child: Stack(
        children: [
          Positioned(
            top: SizeManager.s50.h,
            left: SizeManager.s10.w,
            child: Container(
              decoration: const BoxDecoration(color: ColorManager.white),
              width: SizeManager.s200.w,
              height: SizeManager.s200.w,
              child: Padding(
                padding: EdgeInsets.all(
                  PaddingManager.p5.w,
                ),
                child: Image.asset(
                  imagePath1,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            top: SizeManager.s300.h,
            left: SizeManager.s10.w,
            child: Container(
              decoration: const BoxDecoration(color: ColorManager.white),
              width: SizeManager.s200.w,
              height: SizeManager.s200.w,
              child: Padding(
                padding: EdgeInsets.all(
                  PaddingManager.p5.w,
                ),
                child: Image.asset(
                  imagePath2,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            top: SizeManager.s150.h,
            right: SizeManager.s10.w,
            child: Container(
              decoration: BoxDecoration(color: ColorManager.accentDarkYellow),
              width: SizeManager.s200.w,
              height: SizeManager.s200.w,
              child: Padding(
                padding: EdgeInsets.all(
                  PaddingManager.p5.w,
                ),
                child: Image.asset(
                  imagePath3,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PhotoGrid2 extends StatelessWidget {
  const PhotoGrid2({
    super.key,
    required this.imagePath1,
    required this.imagePath2,
  });

  final String imagePath1;
  final String imagePath2;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeManager.s500.h,
      child: Stack(
        children: [
          Positioned(
            top: SizeManager.s50.h,
            left: SizeManager.s10.w,
            child: Container(
              decoration: BoxDecoration(color: ColorManager.accentDarkYellow),
              width: SizeManager.s200.w,
              height: SizeManager.s200.w,
              child: Padding(
                padding: EdgeInsets.all(
                  PaddingManager.p5.w,
                ),
                child: Image.asset(
                  imagePath1,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            top: SizeManager.s300.h,
            right: SizeManager.s10.w,
            child: Container(
              decoration: const BoxDecoration(color: ColorManager.white),
              width: SizeManager.s200.w,
              height: SizeManager.s200.w,
              child: Padding(
                padding: EdgeInsets.all(
                  PaddingManager.p5.w,
                ),
                child: Image.asset(
                  imagePath2,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PhotoGrid3 extends StatelessWidget {
  const PhotoGrid3({
    super.key,
    required this.imagePath1,
    required this.imagePath2,
    required this.imagePath3,
  });

  final String imagePath1;
  final String imagePath2;
  final String imagePath3;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeManager.s500.h,
      child: Stack(
        children: [
          Positioned(
            top: SizeManager.s150.h,
            left: SizeManager.s10.w,
            child: Container(
              decoration: BoxDecoration(color: ColorManager.accentDarkYellow),
              width: SizeManager.s200.w,
              height: SizeManager.s200.w,
              child: Padding(
                padding: EdgeInsets.all(
                  PaddingManager.p5.w,
                ),
                child: Image.asset(
                  imagePath3,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            top: SizeManager.s50.h,
            right: SizeManager.s10.w,
            child: Container(
              decoration: const BoxDecoration(color: ColorManager.white),
              width: SizeManager.s200.w,
              height: SizeManager.s200.w,
              child: Padding(
                padding: EdgeInsets.all(
                  PaddingManager.p5.w,
                ),
                child: Image.asset(
                  imagePath1,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            top: SizeManager.s300.h,
            right: SizeManager.s10.w,
            child: Container(
              decoration: const BoxDecoration(color: ColorManager.white),
              width: SizeManager.s200.w,
              height: SizeManager.s200.w,
              child: Padding(
                padding: EdgeInsets.all(
                  PaddingManager.p5.w,
                ),
                child: Image.asset(
                  imagePath2,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
