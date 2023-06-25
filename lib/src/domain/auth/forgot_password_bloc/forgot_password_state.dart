part of 'forgot_password_bloc.dart';

class ForgotPasswordState extends Equatable {
  final String email;
  const ForgotPasswordState({
    this.email = '',
  });
  ForgotPasswordState copyWith({String? email}) {
    return ForgotPasswordState(email: email ?? this.email);
  }

  @override
  List<String?> get props => [email];
}
