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
      if (emailAddress.isEmpty) {
        toastInfo(msg: 'You need to provide an email address');
        return;
      }
      if (password.isEmpty) {
        toastInfo(msg: 'You need to provide password');
        return;
      }
      if (name.isEmpty) {
        toastInfo(msg: 'You need to provide your full name');
        return;
      }
      if (confirmPassword.isEmpty) {
        toastInfo(msg: 'Please repeat your password');
        return;
      }
      if (password != confirmPassword) {
        toastInfo(msg: 'Passwords do not match');
      }
//TODO!!!!
      try {
        final credential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailAddress,
          password: password,
        );

        if (credential.user != null) {
          await credential.user?.sendEmailVerification();
          await credential.user?.updateDisplayName(name);
          toastInfo(msg: 'Check your email to verify your account');
          navigate;
        }
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          toastInfo(msg: 'The password is too weak!');
        } else if (e.code == 'email-already-in-use') {
          toastInfo(msg: 'The email is already in use!');
        } else if (e.code == 'invalid-email') {
          toastInfo(msg: 'Invalid email');
        }
      }
    } catch (e) {
      toastInfo(msg: 'Network Error');
    }
  }
}
