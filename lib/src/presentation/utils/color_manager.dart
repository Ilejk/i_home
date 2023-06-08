import 'package:flutter/material.dart';

class ColorManager {
  static const Color black = Colors.black;
  static const Color white = Colors.white;
  static Color primaryDarkGrey = HexColor.fromHex('#202020');
  static Color secondaryDarkGrey = HexColor.fromHex('#2D2D2D');
  static Color accentDarkGrey = HexColor.fromHex('#444444');
  static Color accentDarkYellow = HexColor.fromHex('#DFB63B');
  static Color accentLightYellow = HexColor.fromHex('#F0CD6D');
}

extension HexColor on Color {
  static Color fromHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll('#', '');
    if (hexColorString.length == 6) {
      hexColorString = 'FF$hexColorString';
    }
    return Color(int.parse(hexColorString, radix: 16));
  }
}
