import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_home/src/bloc/forgot_password_bloc/forgot_password_bloc.dart';

import '../../presentation/utils/managers/string_manager.dart';
import '../../presentation/widgets/flutter_toast.dart';

class ForgotPasswordRepository {
  final BuildContext context;
  const ForgotPasswordRepository(this.context);
  Future<void> handlePasswordReset(VoidCallback navigate) async {
    try {
      final state = context.read<ForgotPasswordBloc>().state;
      String emailAddress = state.email;

      var isEmailEmpty = emailAddress.isEmpty;

      if (isEmailEmpty) {
        toastInfo(msg: StringManager.emailMissing);
        return;
      }
      try {
        await FirebaseAuth.instance.sendPasswordResetEmail(email: emailAddress);
        toastInfo(msg: StringManager.resetEmailHasBeenSent);
        navigate();
        print('hello');
      } on FirebaseAuthException catch (e) {
        var isUserNotFound = e.code == ErrorCodeString.uNotFound;
        var isEmailInvalid = e.code == ErrorCodeString.invalidEmail;
        if (isUserNotFound) {
          toastInfo(msg: StringManager.uNotFoundForThisEmail);
        } else if (isEmailInvalid) {
          toastInfo(msg: StringManager.invalidEmail);
        }
      }
    } catch (e) {
      toastInfo(msg: StringManager.netError);
    }
  }
}
