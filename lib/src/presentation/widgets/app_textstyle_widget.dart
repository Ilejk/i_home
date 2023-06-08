import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle appTextStyleWidget({
  required double size,
  required Color color,
  required FontWeight fontWeight,
}) =>
    GoogleFonts.poppins(
      fontSize: size.sp,
      color: color,
      fontWeight: fontWeight,
    );
