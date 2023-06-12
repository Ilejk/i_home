import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_home/src/app/register_bloc/register_bloc.dart';
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
        toastInfo(msg: 'You need to provide an email address');
        return;
      }
      if (isPasswordEmpty) {
        toastInfo(msg: 'You need to provide password');
        return;
      }
      if (isNameEmpty) {
        toastInfo(msg: 'You need to provide your full name');
        return;
      }
      if (isConfirmPasswordEmpty) {
        toastInfo(msg: 'Please repeat your password');
        return;
      }
      if (doesPasswordMatch) {
        toastInfo(msg: 'Passwords do not match');
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
          toastInfo(msg: 'Check your email to verify your account');
          navigate;
        }
      } on FirebaseAuthException catch (e) {
        var isPasswordWeak = e.code == 'weak-password';
        var isEmailInUse = e.code == 'email-already-in-use';
        var isEmailInvalid = e.code == 'invalid-email';
        if (isPasswordWeak) {
          toastInfo(msg: 'The password is too weak!');
        } else if (isEmailInUse) {
          toastInfo(msg: 'The email is already in use!');
        } else if (isEmailInvalid) {
          toastInfo(msg: 'Invalid email');
        }
      }
    } catch (e) {
      toastInfo(msg: 'Network Error');
    }
  }
}
