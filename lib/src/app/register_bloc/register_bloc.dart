import 'package:bloc/bloc.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(const RegisterState()) {
    on<RegisterEmailEvent>(_emailEvent);
    on<RegisterPasswordEvent>(_passwordEvent);
    on<RegisterNameEvent>(_nameEvent);
    on<RegisterConfirmPasswordEvent>(_confirmPasswordEvent);
  }
  void _emailEvent(RegisterEmailEvent event, Emitter<RegisterState> emit) {
    emit(state.copyWith(email: event.email));
  }

  void _passwordEvent(
      RegisterPasswordEvent event, Emitter<RegisterState> emit) {
    emit(state.copyWith(password: event.password));
  }

  void _nameEvent(RegisterNameEvent event, Emitter<RegisterState> emit) {
    emit(state.copyWith(name: event.name));
  }

  void _confirmPasswordEvent(
      RegisterConfirmPasswordEvent event, Emitter<RegisterState> emit) {
    emit(state.copyWith(confirmPassword: event.confirmPassword));
  }
}
