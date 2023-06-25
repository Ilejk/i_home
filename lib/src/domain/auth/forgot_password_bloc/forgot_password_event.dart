part of 'forgot_password_bloc.dart';

class ForgotPasswordEvent extends Equatable {
  final String email;
  const ForgotPasswordEvent(this.email);

  @override
  List<String?> get props => [email];
}
