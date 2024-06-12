import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_udemy1/features/common/Entities/entities.dart';
import 'package:riverpod_udemy1/features/common/global_loader/global_loader.dart';
import 'package:riverpod_udemy1/features/common/utils/constants.dart';
import 'package:riverpod_udemy1/features/global%20.dart';
import 'package:riverpod_udemy1/features/pages/sign%20in/controller/signin_notifier.dart';
import 'package:riverpod_udemy1/features/pages/sign%20in/repository/sign_in_repo.dart';
import 'package:riverpod_udemy1/features/widgets/popupmessages.dart';
import 'package:riverpod_udemy1/main.dart';

class SigninController {
  // WidgetRef ref;
  SigninController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  void handlesignin(WidgetRef ref) async {
    var state = ref.read(signinNotifierProvider);
    RegExp emailexp =
        RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$');

    emailcontroller.text = state.email;
    passwordcontroller.text = state.password;
    if (!emailexp.hasMatch(state.email)) {
      toastInfo("bad format");
      return;
    }

    if (state.email.isEmpty) {
      toastInfo("Your email is empty");
      return;
    }
    if (state.password.isEmpty) {
      toastInfo("Your password is empty");
      return;
    }
    ref.read(apploaderProvider.notifier).setloaderValue(true);
    try {
      final credential = await SigninRepo.firebaselogIn(
          emailcontroller.text, passwordcontroller.text);
      if (credential.user == null) {
        toastInfo("User not found");
      }
      if (!credential.user!.emailVerified) {
        toastInfo("You must verify your email address first");
      }
      var user = credential.user;
      if (user != null) {
        String? displanyame = user.displayName;
        String? email = user.email;
        String? id = user.uid;
        String? photoUrl = user.photoURL;

        LoginRequestEntity loginRequestEntity = LoginRequestEntity();
        loginRequestEntity.avatar = photoUrl;
        loginRequestEntity.name = displanyame;
        loginRequestEntity.email = email;
        loginRequestEntity.open_id = id;
        loginRequestEntity.type = 1;
        asyncPostAllData(loginRequestEntity);
      } else {
        toastInfo("Login error");
      }
    } on FirebaseAuthException catch (e) {
      toastInfo(e.code);
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }

    ref.read(apploaderProvider.notifier).setloaderValue(false);
  }

  void asyncPostAllData(LoginRequestEntity loginRequestEntity) {
    try {
      // var navigator = Navigator.of(ref.context);
      Global.storageService.setString(
          AppConstants.storageUserProfilekey,
          jsonEncode(
              {'name': 'dbestech', 'email': 'info@dbestech.com', 'age': 34}));
      Global.storageService.setString(AppConstants.storageUserTokenKey, "894");
      navkey.currentState
          ?.pushNamedAndRemoveUntil("/application", (route) => false);
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
    //talk to server
  }
}
