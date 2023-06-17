part of 'edit_account_bloc.dart';

class EditAccountState {
  final String newEmail;
  final String newName;
  const EditAccountState({
    this.newEmail = '',
    this.newName = '',
  });
  EditAccountState copyWith({
    String? newEmail,
    String? newName,
  }) {
    return EditAccountState(
      newEmail: newEmail ?? this.newEmail,
      newName: newName ?? this.newName,
    );
  }
}
