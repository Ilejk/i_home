part of 'change_password_bloc.dart';

abstract class ChangePasswordEvent {
  const ChangePasswordEvent();
}

class ChangePasswordOldPasswordEvent extends ChangePasswordEvent {
  final String oldPassword;
  const ChangePasswordOldPasswordEvent(this.oldPassword);
}

class ChangePasswordNewPasswordEvent extends ChangePasswordEvent {
  final String newPassword;
  const ChangePasswordNewPasswordEvent(this.newPassword);
}
