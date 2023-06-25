import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:i_home/src/domain/repo/device_repository.dart';
import 'package:i_home/src/presentation/utils/managers/asset_manager.dart';
import 'package:i_home/src/presentation/utils/managers/list_manager.dart';

import '../bloc_test/device_bloc_test.dart';

void main() {
  group('DeviceRepository', () {
    late DeviceRepository deviceRepository;
    late BuildContext mockContext;

    setUp(() {
      mockContext = MockBuildContext();
      deviceRepository = DeviceRepository(mockContext);
    });

    test('updateDeviceListValue should update the device list', () {
      ListManager.deviceList = [
        ['TCL 55P735', 'Smart TV', (ImageManager.homeSmartTv), false, true],
        ['AB12BK', 'Smart AC', (ImageManager.homeAC), false, true],
        [
          'GOSUND WB4 ',
          'Smart LIGHT',
          (ImageManager.homeLightBulb),
          false,
          true
        ],
        [
          'SAMSUNG RS6HA8880B1',
          'Smart FRIDGE',
          (ImageManager.homeSmartFridge),
          false,
          false
        ],
      ];

      expect(ListManager.deviceList[0][3], false);
      expect(ListManager.deviceList[1][3], false);
      expect(ListManager.deviceList[2][3], false);
      expect(ListManager.deviceList[3][3], false);

      deviceRepository.updateDeviceListValue(0, true);
      deviceRepository.updateDeviceListValue(1, true);
      deviceRepository.updateDeviceListValue(2, true);
      deviceRepository.updateDeviceListValue(3, true);

      expect(ListManager.deviceList[0][3], true);
      expect(ListManager.deviceList[1][3], true);
      expect(ListManager.deviceList[2][3], true);
      expect(ListManager.deviceList[3][3], true);
    });
  });
}
