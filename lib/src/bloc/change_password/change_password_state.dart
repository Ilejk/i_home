part of 'change_password_bloc.dart';

class ChangePasswordState {
  final String oldPassword;
  final String newPassword;

  const ChangePasswordState({
    this.newPassword = '',
    this.oldPassword = '',
  });

  ChangePasswordState copyWith({
    String? oldPassword,
    String? newPassword,
  }) {
    return ChangePasswordState(
      oldPassword: oldPassword ?? this.oldPassword,
      newPassword: newPassword ?? this.newPassword,
    );
  }
}
