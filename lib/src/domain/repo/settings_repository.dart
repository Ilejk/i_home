import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_home/src/bloc/change_password/change_password_bloc.dart';
import 'package:i_home/src/bloc/edit_account_bloc/edit_account_bloc.dart';
import 'package:i_home/src/domain/repo/profile_repository.dart';
import 'package:i_home/src/presentation/utils/constnants/constants.dart';

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

  Future<void> handleEditAccount(VoidCallback navigate) async {
    try {
      final state = context.read<EditAccountBloc>().state;
      String newEmailAddress = state.newEmail;
      String name = state.newName;
      String password = state.password;

      try {
        String? oldEmail = FirebaseAuth.instance.currentUser!.email;
        String? oldUserName =
            await ProfileRepository(context: context).handleSetUserName();
        var currentUser = FirebaseAuth.instance.currentUser;

        var isEmailDifferent = oldEmail != newEmailAddress;
        var isEmailNotEmpty = newEmailAddress != emptyString;
        if (isEmailDifferent && isEmailNotEmpty) {
          try {
            var credential = EmailAuthProvider.credential(
                email: oldEmail!, password: password);
            await currentUser!
                .reauthenticateWithCredential(credential)
                .then((value) {
              currentUser.updateEmail(newEmailAddress);
            });
          } catch (e) {
            print('Error updating email: $e');
          }

          try {
            await FirebaseFirestore.instance
                .collection('users')
                .doc(currentUser!.uid)
                .update({
              'email': newEmailAddress,
            });
          } catch (e) {
            print('Error updating Firestore: $e');
          }
        }
        var isPasswordNotEmpty = name != emptyString;
        var isNameDifferent = oldUserName != name;
        if (isNameDifferent && isPasswordNotEmpty) {
          await FirebaseFirestore.instance
              .collection('users')
              .doc(currentUser!.uid)
              .update({
            'name': name,
          });
          await currentUser.updateDisplayName(name);
        }

        toastInfo(msg: StringManager.accountInfoHasBeenUpdated);
        navigate();
      } on FirebaseAuthException catch (e) {
        print(e);
        var isPasswordWeak = e.code == ErrorCodeString.weakPW;
        if (isPasswordWeak) {
          toastInfo(msg: StringManager.weakPw);
        }
      }
    } catch (e) {
      toastInfo(msg: StringManager.netError);
    }
  }

  Future<String> getUserName() async {
    try {
      final currentUseruid = FirebaseAuth.instance.currentUser!.uid;
      DocumentSnapshot userDataSnapShot = await FirebaseFirestore.instance
          .collection('users')
          .doc(currentUseruid)
          .get();
      return userDataSnapShot.get('name');
    } catch (e) {
      toastInfo(msg: e.toString());
      return '';
    }
  }

  Future<String> getEmail() async {
    try {
      final currentUseruid = FirebaseAuth.instance.currentUser!.uid;
      DocumentSnapshot userDataSnapShot = await FirebaseFirestore.instance
          .collection('users')
          .doc(currentUseruid)
          .get();
      return userDataSnapShot.get('email');
    } catch (e) {
      toastInfo(msg: e.toString());
      return '';
    }
  }
}
