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
      if (emailAddress.isEmpty) {
        toastInfo(msg: 'You need to provide an email address');
        return;
      }
      if (password.isEmpty) {
        toastInfo(msg: 'You need to provide password');
        return;
      }

      try {
        final credential =
            await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailAddress,
          password: password,
        );
        if (credential.user == null) {
          toastInfo(msg: 'Your account does not exist');
          return;
        }
        if (!credential.user!.emailVerified) {
          toastInfo(msg: 'You are not verified');
          return;
        }
        navigate;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          toastInfo(msg: 'No user found for this email');
        } else if (e.code == 'wrong-password') {
          toastInfo(msg: 'Invalid password');
        } else if (e.code == 'invalid-email') {
          toastInfo(msg: 'Invalid email');
        }
      }
    } catch (e) {
      toastInfo(msg: 'Network Error');
    }
  }
}
