part of 'edit_account_bloc.dart';

class EditAccountState {
  final String newEmail;
  final String newName;
  final String password;
  const EditAccountState({
    this.newEmail = '',
    this.newName = '',
    this.password = '',
  });
  EditAccountState copyWith({
    String? newEmail,
    String? newName,
    String? password,
  }) {
    return EditAccountState(
      newEmail: newEmail ?? this.newEmail,
      newName: newName ?? this.newName,
      password: password ?? this.password,
    );
  }
}
