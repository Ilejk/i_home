part of 'register_bloc.dart';

class RegisterState {
  final String email;
  final String password;
  final String name;
  final String confirmPassword;

  const RegisterState({
    this.email = '',
    this.password = '',
    this.name = '',
    this.confirmPassword = '',
  });
  RegisterState copyWith({
    String? email,
    String? password,
    String? name,
    String? confirmPassword,
  }) {
    return RegisterState(
      email: email ?? this.email,
      password: password ?? this.password,
      name: name ?? this.name,
      confirmPassword: confirmPassword ?? this.confirmPassword,
    );
  }
}
