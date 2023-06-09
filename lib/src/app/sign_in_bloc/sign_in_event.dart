part of 'sign_in_bloc.dart';

abstract class SignInEvent {
  const SignInEvent();
}

class EmailEvent extends SignInEvent {
  final String email;
  const EmailEvent(this.email);
}

class PasswordEvent extends SignInEvent {
  final String password;
  const PasswordEvent(this.password);
}

class NameEvent extends SignInEvent {
  final String name;
  const NameEvent(this.name);
}
