import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_home/src/app/sign_in_bloc/sign_in_bloc.dart';
import 'package:i_home/src/presentation/widgets/flutter_toast.dart';

class SignInRepository {
  final BuildContext context;

  const SignInRepository({required this.context});
  Future<void> handleSignIn(String type) async {
    try {
      if (type == 'email') {
        final state = context.read<SignInBloc>().state;
        String emailAddress = state.email;
        String password = state.password;
        // String name = state.name;
        if (emailAddress.isEmpty) {
          toastInfo(msg: 'You need to provide an email address');
          return;
        }
        if (password.isEmpty) {
          toastInfo(msg: 'You need to provide password');
          return;
        }
        // if (name.isEmpty) {
        //   print('name is empty');
        //   //TODO
        // }
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
          var user = credential.user;
          if (user != null) {
            print('user exists');
            //TODO
          } else {
            toastInfo(msg: 'Error');
            return;
          }
        } on FirebaseAuthException catch (e) {
          if (e.code == 'user-not-found') {
            toastInfo(msg: 'No user found for this email');
          } else if (e.code == 'wrong-password') {
            toastInfo(msg: 'Incorrect password');
          } else if (e.code == 'invalid-email') {
            toastInfo(msg: 'Incorrect email');
          }
        }
      }
    } catch (e) {
      toastInfo(msg: 'Network Error');
    }
  }
}
