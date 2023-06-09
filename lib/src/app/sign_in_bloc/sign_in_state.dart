part of 'sign_in_bloc.dart';

class SignInState {
  final String email;
  final String password;
  final String name;
  const SignInState({
    this.email = '',
    this.password = '',
    this.name = '',
  });
  SignInState copyWith({String? email, String? password, String? name}) {
    return SignInState(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}
