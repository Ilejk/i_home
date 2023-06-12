import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:i_home/src/presentation/utils/managers/color_manager.dart';
import 'package:i_home/src/presentation/utils/managers/font_manager.dart';

toastInfo({
  required String msg,
  Color bgColor = ColorManager.black,
  Color textColor = ColorManager.white,
}) {
  return Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.TOP,
    timeInSecForIosWeb: 2,
    backgroundColor: bgColor,
    textColor: textColor,
    fontSize: FontSize.s15.sp,
  );
}
