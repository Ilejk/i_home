part of 'sign_in_bloc.dart';

abstract class SignInEvent extends Equatable {
  const SignInEvent();
}

class SignInEmailEvent extends SignInEvent {
  final String email;
  const SignInEmailEvent(this.email);

  @override
  List<String?> get props => [email];
}

class SignInPasswordEvent extends SignInEvent {
  final String password;
  const SignInPasswordEvent(this.password);

  @override
  List<String?> get props => [password];
}
