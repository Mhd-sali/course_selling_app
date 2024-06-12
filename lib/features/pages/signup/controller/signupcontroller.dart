import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_udemy1/features/common/global_loader/global_loader.dart';
import 'package:riverpod_udemy1/features/pages/signup/controller/registerstate.dart';
import 'package:riverpod_udemy1/features/pages/signup/repository/sign_up_repo.dart';
import 'package:riverpod_udemy1/features/widgets/popupmessages.dart';

class SignUpController {
  final WidgetRef ref;
  SignUpController(this.ref);
  Future<void> handleSignup() async {
    var state = ref.read(regNOtProvider);
    String? name = state.username;
    String? email = state.email;
    String? password = state.password;
    String? repassword = state.repassword;

    if (state.username.isEmpty || name.isEmpty) {
      toastInfo("Your name is empty");
      return;
    }
    if (state.username.length < 6 || name.length < 6) {
      toastInfo("Your name is too short");
      return;
    }
    if (state.email.isEmpty || email.isEmpty) {
      toastInfo("Your email is empty");
      return;
    }
    if ((state.password.isEmpty || state.repassword.isEmpty) ||
        password.isEmpty ||
        repassword.isEmpty) {
      toastInfo("Your password is empty");
      return;
    }
    if ((state.password != state.repassword) || password != repassword) {
      toastInfo("Your password did not match");
      return;
    }
    ref.read(apploaderProvider.notifier).setloaderValue(true);
    var context = Navigator.of(ref.context);
    try {
      final credential = await SignUpRepo.firebaselogIn(email, password);
      if (kDebugMode) {
        print(credential);
      }
      if (credential.user != null) {
        await credential.user?.sendEmailVerification();
        await credential.user?.updateDisplayName(name);
        toastInfo(
            "an email has been sent to verify your account.Please open that email");
        context.pop();
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        toastInfo("the password is too weak");
      } else if (e.code == 'email-already-in-use') {
        toastInfo("This email address has already been registered");
      } else if (e.code == 'user-not-found') {
        toastInfo("User not found");
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
    ref.watch(apploaderProvider.notifier).setloaderValue(false);
  }
}
