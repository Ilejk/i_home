part of 'edit_account_bloc.dart';

abstract class EditAccountEvent extends Equatable {
  const EditAccountEvent();
}

class EditAccountNewEmailEvent extends EditAccountEvent {
  final String newEmail;
  const EditAccountNewEmailEvent(this.newEmail);

  @override
  List<String?> get props => [newEmail];
}

class EditAccountNewNameEvent extends EditAccountEvent {
  final String newName;
  const EditAccountNewNameEvent(this.newName);

  @override
  List<String?> get props => [newName];
}

class EditAccountPasswordEvent extends EditAccountEvent {
  final String password;
  const EditAccountPasswordEvent(this.password);

  @override
  List<String?> get props => [password];
}
