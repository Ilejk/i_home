import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_home/src/domain/auth/sign_in_bloc/sign_in_bloc.dart';
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

      if (emailAddress.isEmpty) {
        toastInfo(msg: StringManager.emailMissing);
        return;
      }

      if (password.isEmpty) {
        toastInfo(msg: StringManager.passwordMissing);
        return;
      }

      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );

      if (credential.user == null) {
        toastInfo(msg: StringManager.accDoesNotExist);
        return;
      }

      if (!credential.user!.emailVerified) {
        toastInfo(msg: StringManager.notVerified);
        return;
      }

      final uid = FirebaseAuth.instance.currentUser!.uid;
      GBM.storageService.setString(AppConst.STORAGE_USER_TOKEN_KEY, uid);

      navigate();
    } on FirebaseAuthException catch (e) {
      if (e.code == ErrorCodeString.uNotFound) {
        toastInfo(msg: StringManager.uNotFoundForThisEmail);
      } else if (e.code == ErrorCodeString.wrongPW) {
        toastInfo(msg: StringManager.invalidPW);
      } else if (e.code == ErrorCodeString.invalidEmail) {
        toastInfo(msg: StringManager.invalidEmail);
      }
    } catch (e) {
      toastInfo(msg: StringManager.netError);
    }
  }
}
