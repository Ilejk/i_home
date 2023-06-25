part of 'change_password_bloc.dart';

abstract class ChangePasswordEvent extends Equatable {
  const ChangePasswordEvent();
}

class ChangePasswordOldPasswordEvent extends ChangePasswordEvent {
  final String oldPassword;
  const ChangePasswordOldPasswordEvent(this.oldPassword);

  @override
  List<String?> get props => [oldPassword];
}

class ChangePasswordNewPasswordEvent extends ChangePasswordEvent {
  final String newPassword;
  const ChangePasswordNewPasswordEvent(this.newPassword);
  @override
  List<String?> get props => [newPassword];
}
