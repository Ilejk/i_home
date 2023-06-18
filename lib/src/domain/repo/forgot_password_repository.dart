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

      if (emailAddress.isEmpty) {
        toastInfo(msg: StringManager.emailMissing);
        return;
      }

      try {
        await FirebaseAuth.instance.sendPasswordResetEmail(email: emailAddress);
        toastInfo(msg: StringManager.resetEmailHasBeenSent);
        navigate();
      } on FirebaseAuthException catch (e) {
        if (e.code == ErrorCodeString.uNotFound) {
          toastInfo(msg: StringManager.uNotFoundForThisEmail);
        } else if (e.code == ErrorCodeString.invalidEmail) {
          toastInfo(msg: StringManager.invalidEmail);
        }
      }
    } catch (e) {
      toastInfo(msg: StringManager.netError);
    }
  }
}
