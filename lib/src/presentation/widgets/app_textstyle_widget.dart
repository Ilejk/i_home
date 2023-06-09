import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle appTextStyleWidget({
  required double size,
  required Color color,
  required FontWeight fontWeight,
  double letterSpacing = 0,
}) =>
    GoogleFonts.poppins(
      fontSize: size.sp,
      letterSpacing: letterSpacing,
      color: color,
      fontWeight: fontWeight,
    );
