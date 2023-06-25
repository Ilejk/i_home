part of 'sign_in_bloc.dart';

class SignInState extends Equatable {
  final String email;
  final String password;

  const SignInState({
    this.email = '',
    this.password = '',
  });
  SignInState copyWith({
    String? email,
    String? password,
  }) {
    return SignInState(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  @override
  List<String?> get props => [email, password];
}
