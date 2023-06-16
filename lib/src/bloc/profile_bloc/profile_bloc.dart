import 'package:bloc/bloc.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(const ProfileState()) {
    on<PickImageEvent>(_pickImageEvent);
  }
  void _pickImageEvent(PickImageEvent event, Emitter<ProfileState> emit) {
    emit(state.copywith(imagePickerURL: event.imageUrl));
  }
}
