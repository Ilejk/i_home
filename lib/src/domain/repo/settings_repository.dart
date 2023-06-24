import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_home/src/domain/auth/change_password/change_password_bloc.dart';
import 'package:i_home/src/domain/core/edit_account_bloc/edit_account_bloc.dart';
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

      if (oldPassword.isEmpty) {
        toastInfo(msg: StringManager.passwordMissing);
        return;
      }

      if (newPassword.isEmpty) {
        toastInfo(msg: StringManager.passwordMissing);
        return;
      }

      if (newPassword == oldPassword) {
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
        if (e.code == ErrorCodeString.weakPW) {
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

        if (oldEmail != newEmailAddress && newEmailAddress.isNotEmpty) {
          try {
            var credential = EmailAuthProvider.credential(
                email: oldEmail!, password: password);
            await currentUser!
                .reauthenticateWithCredential(credential)
                .then((value) {
              currentUser.updateEmail(newEmailAddress);
            });
          } catch (e) {
            toastInfo(msg: StringManager.errorUpdatingEmail);
          }

          try {
            await FirebaseFirestore.instance
                .collection('users')
                .doc(currentUser!.uid)
                .update({
              'email': newEmailAddress,
            });
          } catch (e) {
            toastInfo(msg: StringManager.errorupdatingStore);
          }
        }

        if (oldUserName != name && name.isNotEmpty) {
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
        if (e.code == ErrorCodeString.weakPW) {
          toastInfo(msg: StringManager.weakPw);
        }
      }
    } catch (e) {
      toastInfo(msg: StringManager.netError);
    }
  }

  Future<String> getUserName() async {
    try {
      final currentUserUID = FirebaseAuth.instance.currentUser!.uid;
      DocumentSnapshot userDataSnapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(currentUserUID)
          .get();
      return userDataSnapshot.get('name') as String;
    } catch (e) {
      toastInfo(msg: e.toString());
      return emptyString;
    }
  }

  Future<String> getEmail() async {
    try {
      final currentUserUID = FirebaseAuth.instance.currentUser!.uid;
      DocumentSnapshot userDataSnapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(currentUserUID)
          .get();
      return userDataSnapshot.get('email') as String;
    } catch (e) {
      toastInfo(msg: e.toString());
      return emptyString;
    }
  }
}
