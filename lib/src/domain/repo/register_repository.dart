import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_home/src/bloc/register_bloc/register_bloc.dart';
import 'package:i_home/src/presentation/utils/managers/string_manager.dart';
import 'package:i_home/src/presentation/widgets/flutter_toast.dart';

class RegisterRepository {
  final BuildContext context;

  const RegisterRepository({required this.context});

  Future<void> handleEmailRegister(VoidCallback navigate) async {
    try {
      final state = context.read<RegisterBloc>().state;
      String emailAddress = state.email;
      String password = state.password;
      String name = state.name;
      String confirmPassword = state.confirmPassword;

      if (emailAddress.isEmpty) {
        toastInfo(msg: StringManager.emailMissing);
        return;
      }

      if (password.isEmpty) {
        toastInfo(msg: StringManager.passwordMissing);
        return;
      }

      if (name.isEmpty) {
        toastInfo(msg: StringManager.nameMissing);
        return;
      }

      if (confirmPassword.isEmpty) {
        toastInfo(msg: StringManager.repeatPW);
        return;
      }

      if (password != confirmPassword) {
        toastInfo(msg: StringManager.pwAreDiff);
        return;
      }

      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );

      if (credential.user != null) {
        await credential.user?.sendEmailVerification();
        await credential.user?.updateDisplayName(name);
        toastInfo(msg: StringManager.checkEmailtoVerify);

        await FirebaseFirestore.instance
            .collection('users')
            .doc(credential.user!.uid)
            .set({
          'email': emailAddress,
          'name': name,
        });

        navigate();
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == ErrorCodeString.weakPW) {
        toastInfo(msg: StringManager.weakPw);
      } else if (e.code == ErrorCodeString.emailInUse) {
        toastInfo(msg: StringManager.emailInUse);
      } else if (e.code == ErrorCodeString.invalidEmail) {
        toastInfo(msg: StringManager.invalidEmail);
      }
    } catch (e) {
      toastInfo(msg: StringManager.netError);
    }
  }
}
