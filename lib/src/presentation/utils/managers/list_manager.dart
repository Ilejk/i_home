import 'package:i_home/src/presentation/utils/managers/asset_manager.dart';

class ListManager {
  static List<List<dynamic>> deviceList = [
    ['TCL 55P735', 'Smart TV', (ImageManager.homeSmartTv), false, true],
    ['AB12BK', 'Smart AC', (ImageManager.homeAC), false, true],
    ['GOSUND WB4 ', 'Smart LIGHT', (ImageManager.homeLightBulb), false, true],
    [
      'SAMSUNG RS6HA8880B1',
      'Smart FRIDGE',
      (ImageManager.homeSmartFridge),
      true,
      false
    ],
  ];
}
