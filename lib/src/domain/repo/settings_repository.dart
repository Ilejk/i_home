import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_home/src/bloc/change_password/change_password_bloc.dart';

import '../../bloc/register_bloc/register_bloc.dart';
import '../../presentation/utils/managers/string_manager.dart';
import '../../presentation/widgets/flutter_toast.dart';

class SettingsRepository {
  final BuildContext context;
  const SettingsRepository(this.context);
  Future<void> handleChanePassword(VoidCallback navigate) async {
    try {
      final state = context.read<ChangePasswordBloc>().state;
      String oldPassword = state.oldPassword;
      String newPassword = state.newPassword;

      var isOldPasswordEmpty = oldPassword.isEmpty;
      var isNewPasswordEmpty = newPassword.isEmpty;
      var isNewPasswordDifferentFromOldPassword = newPassword == oldPassword;

      if (isOldPasswordEmpty) {
        toastInfo(msg: StringManager.emailMissing);
        return;
      }
      if (isNewPasswordEmpty) {
        toastInfo(msg: StringManager.passwordMissing);
        return;
      }
      if (isNewPasswordDifferentFromOldPassword) {
        toastInfo(msg: StringManager.theSamePassword);
        return;
      }

      try {
        String? email = FirebaseAuth.instance.currentUser!.email;
        var credential =
            EmailAuthProvider.credential(email: email!, password: oldPassword);
        var currentUser = FirebaseAuth.instance.currentUser;
        await currentUser!
            .reauthenticateWithCredential(credential)
            .then((value) {
          currentUser.updatePassword(newPassword);
        });
        toastInfo(msg: StringManager.passwordChanged);
        navigate();
      } on FirebaseAuthException catch (e) {
        var isPasswordWeak = e.code == ErrorCodeString.weakPW;
        if (isPasswordWeak) {
          toastInfo(msg: StringManager.weakPw);
        }
      }
    } catch (e) {
      toastInfo(msg: StringManager.netError);
    }
  }
}
