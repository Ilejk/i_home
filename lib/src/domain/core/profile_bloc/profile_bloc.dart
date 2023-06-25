import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(const ProfileState()) {
    on<PickImageEvent>(_pickImageEvent);
    on<SetUserName>(_setUserName);
  }
  void _pickImageEvent(PickImageEvent event, Emitter<ProfileState> emit) {
    emit(state.copywith(imagePickerURL: event.imageUrl));
  }

  void _setUserName(SetUserName event, Emitter<ProfileState> emit) {
    emit(state.copywith(userName: event.userName));
  }
}
