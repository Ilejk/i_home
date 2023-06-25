part of 'device_bloc.dart';

class DeviceState extends Equatable {
  final bool isOnValue;

  const DeviceState({
    this.isOnValue = false,
  });

  DeviceState copyWith({
    bool? isOnValue,
  }) {
    return DeviceState(
      isOnValue: isOnValue ?? this.isOnValue,
    );
  }

  @override
  List<bool?> get props => [isOnValue];
}
