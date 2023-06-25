import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'forgot_password_event.dart';
part 'forgot_password_state.dart';

class ForgotPasswordBloc
    extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  ForgotPasswordBloc() : super(const ForgotPasswordState()) {
    on<ForgotPasswordEvent>(_forgotPasswordEvent);
  }
  void _forgotPasswordEvent(
      ForgotPasswordEvent event, Emitter<ForgotPasswordState> emit) {
    emit(state.copyWith(email: event.email));
  }
}
