part of 'register_bloc.dart';

abstract class RegisterEvent {
  const RegisterEvent();
}

class RegisterEmailEvent extends RegisterEvent {
  final String email;
  const RegisterEmailEvent(this.email);
}

class RegisterPasswordEvent extends RegisterEvent {
  final String password;
  const RegisterPasswordEvent(this.password);
}

class RegisterConfirmPasswordEvent extends RegisterEvent {
  final String confirmPassword;
  const RegisterConfirmPasswordEvent(this.confirmPassword);
}

class RegisterNameEvent extends RegisterEvent {
  final String name;
  const RegisterNameEvent(this.name);
}
