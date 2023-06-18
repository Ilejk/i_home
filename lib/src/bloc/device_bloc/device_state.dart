part of 'device_bloc.dart';

class DeviceState {
  final String type;
  final String name;
  final bool isOnValue;
  final String iconData;
  final String deviceID;
  final List<DeviceModel> devices;
  final bool isLoading;
  const DeviceState({
    this.iconData = '',
    this.isOnValue = false,
    this.name = '',
    this.type = '',
    this.deviceID = '',
    this.devices = const [],
    this.isLoading = false,
  });

  DeviceState copyWith({
    String? type,
    String? name,
    bool? isOnValue,
    String? iconData,
    String? deviceID,
    bool? isLoading,
    List<DeviceModel>? devices,
  }) {
    return DeviceState(
      type: type ?? this.type,
      name: name ?? this.name,
      iconData: iconData ?? this.iconData,
      isOnValue: isOnValue ?? this.isOnValue,
      deviceID: deviceID ?? this.deviceID,
      devices: devices ?? this.devices,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
