import 'package:bloc/bloc.dart';
import 'package:i_home/src/domain/repo/device_repository.dart';

part 'device_event.dart';
part 'device_state.dart';

class DeviceBloc extends Bloc<DeviceEvent, DeviceState> {
  final DeviceRepository deviceRepository;
  DeviceBloc(this.deviceRepository) : super(const DeviceState()) {
    on<SwitchValueEvent>(_switchValueEvent);
  }

  void _switchValueEvent(SwitchValueEvent event, Emitter<DeviceState> emit) {
    deviceRepository.updateDeviceListValue(event.index, event.newValue);
    emit(state.copyWith(isOnValue: event.newValue));
  }
}
