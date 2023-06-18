part of 'device_bloc.dart';

abstract class DeviceEvent {
  const DeviceEvent();
}

class DeviceTypeEvent extends DeviceEvent {
  final String type;
  const DeviceTypeEvent(this.type);
}

class DeviceNameEvent extends DeviceEvent {
  final String name;
  const DeviceNameEvent(this.name);
}

class DeviceBoolEvent extends DeviceEvent {
  final bool isOnValue;
  const DeviceBoolEvent(this.isOnValue);
}

class DeviceIconEvent extends DeviceEvent {
  final String iconData;
  const DeviceIconEvent(this.iconData);
}

class DeviceIdEvent extends DeviceEvent {
  final String deviceID;
  const DeviceIdEvent(this.deviceID);
}

class FetchDevicesEvent extends DeviceEvent {}
