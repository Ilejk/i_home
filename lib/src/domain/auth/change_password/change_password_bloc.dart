import 'package:bloc/bloc.dart';

part 'change_password_event.dart';
part 'change_password_state.dart';

class ChangePasswordBloc
    extends Bloc<ChangePasswordEvent, ChangePasswordState> {
  ChangePasswordBloc() : super(const ChangePasswordState()) {
    on<ChangePasswordOldPasswordEvent>(_changePasswordOldPasswordEvent);
    on<ChangePasswordNewPasswordEvent>(_changePasswordNewPasswordEvent);
  }

  void _changePasswordOldPasswordEvent(
      ChangePasswordOldPasswordEvent event, Emitter<ChangePasswordState> emit) {
    emit(state.copyWith(oldPassword: event.oldPassword));
  }

  void _changePasswordNewPasswordEvent(
      ChangePasswordNewPasswordEvent event, Emitter<ChangePasswordState> emit) {
    emit(state.copyWith(newPassword: event.newPassword));
  }
}
