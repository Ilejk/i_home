part of 'device_bloc.dart';

abstract class DeviceEvent {
  const DeviceEvent();
}

class SwitchValueEvent extends DeviceEvent {
  final int index;
  final bool newValue;
  const SwitchValueEvent(this.index, this.newValue);
}
