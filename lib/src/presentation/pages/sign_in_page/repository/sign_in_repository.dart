import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_home/src/app/sign_in_bloc/sign_in_bloc.dart';
import 'package:i_home/src/presentation/widgets/flutter_toast.dart';

class SignInRepository {
  final BuildContext context;

  const SignInRepository({required this.context});
  Future<void> handleSignIn(VoidCallback navigate) async {
    try {
      final state = context.read<SignInBloc>().state;
      String emailAddress = state.email;
      String password = state.password;
      var isPasswordEmpty = password.isEmpty;
      var isEmailEmpty = emailAddress.isEmpty;
      if (isEmailEmpty) {
        toastInfo(msg: 'You need to provide an email address');
        return;
      }
      if (isPasswordEmpty) {
        toastInfo(msg: 'You need to provide password');
        return;
      }
      try {
        final credential =
            await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailAddress,
          password: password,
        );
        var doesUserExist = credential.user == null;
        var isUserNotVerified = !credential.user!.emailVerified;
        if (doesUserExist) {
          toastInfo(msg: 'Your account does not exist');
          return;
        }
        if (isUserNotVerified) {
          toastInfo(msg: 'You are not verified');
          return;
        }
        navigate;
      } on FirebaseAuthException catch (e) {
        var isUserNotFound = e.code == 'user-not-found';
        var isPasswordWrong = e.code == 'wrong-password';
        var isEmailInvalid = e.code == 'invalid-email';
        if (isUserNotFound) {
          toastInfo(msg: 'No user found for this email');
        } else if (isPasswordWrong) {
          toastInfo(msg: 'Invalid password');
        } else if (isEmailInvalid) {
          toastInfo(msg: 'Invalid email');
        }
      }
    } catch (e) {
      toastInfo(msg: 'Network Error');
    }
  }
}
