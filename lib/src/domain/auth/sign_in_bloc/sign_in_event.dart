part of 'sign_in_bloc.dart';

abstract class SignInEvent {
  const SignInEvent();
}

class SignInEmailEvent extends SignInEvent {
  final String email;
  const SignInEmailEvent(this.email);
}

class SignInPasswordEvent extends SignInEvent {
  final String password;
  const SignInPasswordEvent(this.password);
}
