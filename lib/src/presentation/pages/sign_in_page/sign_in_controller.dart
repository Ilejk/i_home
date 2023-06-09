import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_home/src/app/sign_in_bloc/sign_in_bloc.dart';

class SignInController {
  final BuildContext context;

  const SignInController({required this.context});
  Future<void> handleSignIn(String type) async {
    try {
      if (type == 'email') {
        final state = context.read<SignInBloc>().state;
        String emailAddress = state.email;
        String password = state.password;
        String name = state.name;
        if (emailAddress.isEmpty) {
          //TODO
        }
        if (password.isEmpty) {
          //TODO
        }
        if (name.isEmpty) {
          //TODO
        }
        try {
          final credential =
              await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: emailAddress,
            password: password,
          );
          if (credential.user == null) {
            //TODO
          }
          if (!credential.user!.emailVerified) {
            //TODO
          }
          var user = credential.user;
          if (user != null) {
            //TODO
          } else {
            //TODO
          }
        } catch (e) {}
      }
    } catch (e) {}
  }
}
