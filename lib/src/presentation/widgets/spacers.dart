import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeightSpacer extends StatelessWidget {
  final double iH;

  const HeightSpacer({super.key, required this.iH});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: iH.h,
    );
  }
}

class WidthSpacer extends StatelessWidget {
  final double iW;

  const WidthSpacer({super.key, required this.iW});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: iW.w,
    );
  }
}
