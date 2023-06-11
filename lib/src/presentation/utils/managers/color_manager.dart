import 'package:flutter/material.dart';

class ColorManager {
  static const Color black = Colors.black;
  static const Color black87 = Colors.black87;
  static const Color black54 = Colors.black54;
  static const Color black26 = Colors.black26;
  static const Color white = Colors.white;
  static const Color white54 = Colors.white54;
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
