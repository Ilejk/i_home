import 'package:bloc/bloc.dart';
import 'package:i_home/src/domain/models/device_model.dart';
import 'package:i_home/src/domain/repo/device_repository.dart';

part 'device_event.dart';
part 'device_state.dart';

class DeviceBloc extends Bloc<DeviceEvent, DeviceState> {
  final DeviceRepository deviceRepository;
  DeviceBloc(this.deviceRepository) : super(const DeviceState()) {
    on<DeviceTypeEvent>(_deviceTypeEvent);
    on<DeviceNameEvent>(_deviceNameEvent);
    on<DeviceBoolEvent>(_deviceBoolEvent);
    on<DeviceIconEvent>(_deviceIconEvent);
    on<DeviceIdEvent>(_deviceIDEvent);
    on<FetchDevicesEvent>(_fetchDevicesEvent);
  }

  void _deviceTypeEvent(DeviceTypeEvent event, Emitter<DeviceState> emit) {
    emit(state.copyWith(type: event.type));
  }

  void _deviceNameEvent(DeviceNameEvent event, Emitter<DeviceState> emit) {
    emit(state.copyWith(name: event.name));
  }

  void _deviceBoolEvent(DeviceBoolEvent event, Emitter<DeviceState> emit) {
    emit(state.copyWith(isOnValue: event.isOnValue));
  }

  void _deviceIconEvent(DeviceIconEvent event, Emitter<DeviceState> emit) {
    emit(state.copyWith(iconData: event.iconData));
  }

  void _deviceIDEvent(DeviceIdEvent event, Emitter<DeviceState> emit) {
    emit(state.copyWith(deviceID: event.deviceID));
  }

  void _fetchDevicesEvent(
      FetchDevicesEvent event, Emitter<DeviceState> emit) async {
    emit(state.copyWith(isLoading: true));
    try {
      final devices = await deviceRepository.fetchAndSetDevices();
      emit(state.copyWith(devices: devices));
      emit(state.copyWith(isLoading: false));
    } catch (e) {
      emit(state.copyWith(isLoading: true));
      rethrow;
    }
  }
}
