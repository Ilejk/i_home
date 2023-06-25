part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();
}

class RegisterEmailEvent extends RegisterEvent {
  final String email;
  const RegisterEmailEvent(this.email);

  @override
  List<String?> get props => [email];
}

class RegisterPasswordEvent extends RegisterEvent {
  final String password;
  const RegisterPasswordEvent(this.password);

  @override
  List<String?> get props => [password];
}

class RegisterConfirmPasswordEvent extends RegisterEvent {
  final String confirmPassword;
  const RegisterConfirmPasswordEvent(this.confirmPassword);

  @override
  List<String?> get props => [confirmPassword];
}

class RegisterNameEvent extends RegisterEvent {
  final String name;
  const RegisterNameEvent(this.name);

  @override
  List<String?> get props => [name];
}
