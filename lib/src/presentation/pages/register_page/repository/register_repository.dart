import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_home/src/app/register_bloc/register_bloc.dart';
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
      var isEmailEmpty = emailAddress.isEmpty;
      var isPasswordEmpty = password.isEmpty;
      var isNameEmpty = name.isEmpty;
      var isConfirmPasswordEmpty = confirmPassword.isEmpty;
      var doesPasswordMatch = password != confirmPassword;
      if (isEmailEmpty) {
        toastInfo(msg: StringManager.emailMissing);
        return;
      }
      if (isPasswordEmpty) {
        toastInfo(msg: StringManager.passwordMissing);
        return;
      }
      if (isNameEmpty) {
        toastInfo(msg: StringManager.nameMissing);
        return;
      }
      if (isConfirmPasswordEmpty) {
        toastInfo(msg: StringManager.repeatPW);
        return;
      }
      if (doesPasswordMatch) {
        toastInfo(msg: StringManager.pwAreDiff);
      }
//TODO!!!!
      try {
        final credential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailAddress,
          password: password,
        );

        var isThereAUser = credential.user != null;
        if (isThereAUser) {
          await credential.user?.sendEmailVerification();
          await credential.user?.updateDisplayName(name);
          toastInfo(msg: StringManager.checkEmailtoVerify);
          navigate;
        }
      } on FirebaseAuthException catch (e) {
        var isPasswordWeak = e.code == ErrorCodeString.weakPW;
        var isEmailInUse = e.code == ErrorCodeString.emailInUse;
        var isEmailInvalid = e.code == ErrorCodeString.invalidEmail;
        if (isPasswordWeak) {
          toastInfo(msg: StringManager.weakPw);
        } else if (isEmailInUse) {
          toastInfo(msg: StringManager.emailInUse);
        } else if (isEmailInvalid) {
          toastInfo(msg: StringManager.invalidEmail);
        }
      }
    } catch (e) {
      toastInfo(msg: StringManager.netError);
    }
  }
}
