part of 'edit_account_bloc.dart';

abstract class EditAccountEvent {
  const EditAccountEvent();
}

class EditAccountNewEmailEvent extends EditAccountEvent {
  final String newEmail;
  const EditAccountNewEmailEvent(this.newEmail);
}

class EditAccountNewNameEvent extends EditAccountEvent {
  final String newName;
  const EditAccountNewNameEvent(this.newName);
}
