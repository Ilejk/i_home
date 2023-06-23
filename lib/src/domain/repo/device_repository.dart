import 'package:flutter/material.dart';
import 'package:i_home/src/presentation/utils/managers/list_manager.dart';

class DeviceRepository {
  final BuildContext context;

  DeviceRepository(this.context);

  void updateDeviceListValue(int index, bool newValue) {
    ListManager.deviceList[index][3] = newValue;
  }
}
