part of 'device_bloc.dart';

abstract class DeviceEvent extends Equatable {
  const DeviceEvent();
}

class SwitchValueEvent extends DeviceEvent {
  final int index;
  final bool newValue;
  const SwitchValueEvent(this.index, this.newValue);

  @override
  List<dynamic> get props => [index, newValue];
}
