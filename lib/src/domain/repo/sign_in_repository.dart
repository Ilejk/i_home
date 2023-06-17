import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_home/src/bloc/sign_in_bloc/sign_in_bloc.dart';
import 'package:i_home/src/presentation/utils/constnants/constants.dart';
import 'package:i_home/src/presentation/utils/global/global_methods.dart';
import 'package:i_home/src/presentation/utils/managers/string_manager.dart';
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
        toastInfo(msg: StringManager.emailMissing);
        return;
      }
      if (isPasswordEmpty) {
        toastInfo(msg: StringManager.passwordMissing);
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
          toastInfo(msg: StringManager.accDoesNotExist);
          return;
        }
        if (isUserNotVerified) {
          toastInfo(msg: StringManager.notVerified);
          return;
        }
        final uid = FirebaseAuth.instance.currentUser!.uid;
        GBM.storageService.setString(AppConst.STORAGE_USER_TOKEN_KEY, uid);
        navigate;
      } on FirebaseAuthException catch (e) {
        var isUserNotFound = e.code == ErrorCodeString.uNotFound;
        var isPasswordWrong = e.code == ErrorCodeString.wrongPW;
        var isEmailInvalid = e.code == ErrorCodeString.invalidEmail;
        if (isUserNotFound) {
          toastInfo(msg: StringManager.uNotFoundForThisEmail);
        } else if (isPasswordWrong) {
          toastInfo(msg: StringManager.invalidPW);
        } else if (isEmailInvalid) {
          toastInfo(msg: StringManager.invalidEmail);
        }
      }
    } catch (e) {
      toastInfo(msg: StringManager.netError);
    }
  }
}
