import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_udemy1/features/common/routes/app_route_names.dart';
import 'package:riverpod_udemy1/features/global%20.dart';
import 'package:riverpod_udemy1/features/pages/application/view/application.dart';
import 'package:riverpod_udemy1/features/pages/home/view/home.dart';
import 'package:riverpod_udemy1/features/pages/sign%20in/view/sign_in.dart';
import 'package:riverpod_udemy1/features/pages/signup/view/sign_up.dart';
import 'package:riverpod_udemy1/features/pages/welcome/welcome.dart';

class AppPages {
  static List<RoutEntity> routes() {
    return [
      RoutEntity(page: Welcome(), path: Approutenames.welcome),
      RoutEntity(page: const Signin(), path: Approutenames.signin),
      RoutEntity(page: const SignUp(), path: Approutenames.register),
      RoutEntity(page: const Application(), path: Approutenames.application),
      RoutEntity(page: const HomeScreen(), path: Approutenames.home)
    ];
  }

  static MaterialPageRoute generateroutesettings(RouteSettings settings) {
    if (kDebugMode) {
      print("my route is ${settings.name}");
    }

    if (settings.name != null) {
      var result = routes().where((element) => element.path == settings.name);
      print(result.toList().length);

      if (result.isNotEmpty) {
        bool devicefirstTime = Global.storageService.getDeviceFirstOpen();

        if (result.first.path == Approutenames.welcome && devicefirstTime) {
          bool isloggedin = Global.storageService.isloggedin();

          if (isloggedin) {
            return MaterialPageRoute(
                builder: (_) => const Application(), settings: settings);
          } else {
            return MaterialPageRoute(
                builder: (_) => const Signin(), settings: settings);
          }
        } else {
          return MaterialPageRoute(
              builder: (_) => result.first.page, settings: settings);
        }
      }
    }
    return MaterialPageRoute(builder: (_) => Welcome(), settings: settings);
  }
}

class RoutEntity {
  String path;
  Widget page;
  RoutEntity({required this.page, required this.path});
}
