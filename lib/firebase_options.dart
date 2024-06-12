// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDMX5Ishxgl9_UUnSBJuJsIgYxcPXoxd24',
    appId: '1:63143179779:web:71a8bade08057c7b1fc036',
    messagingSenderId: '63143179779',
    projectId: 'riverpodudemy1',
    authDomain: 'riverpodudemy1.firebaseapp.com',
    storageBucket: 'riverpodudemy1.appspot.com',
    measurementId: 'G-ZWQR8CVSCR',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB8kSqlk1fyTsIb0jImOzSLqFqMsTcarFg',
    appId: '1:63143179779:android:7ae115965c56ed741fc036',
    messagingSenderId: '63143179779',
    projectId: 'riverpodudemy1',
    storageBucket: 'riverpodudemy1.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBuqDjn4FPzhMHcW6D-v60bk3WEEKNZ_9g',
    appId: '1:63143179779:ios:b8dbb31243d963aa1fc036',
    messagingSenderId: '63143179779',
    projectId: 'riverpodudemy1',
    storageBucket: 'riverpodudemy1.appspot.com',
    iosBundleId: 'com.example.riverpodUdemy1',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBuqDjn4FPzhMHcW6D-v60bk3WEEKNZ_9g',
    appId: '1:63143179779:ios:b8dbb31243d963aa1fc036',
    messagingSenderId: '63143179779',
    projectId: 'riverpodudemy1',
    storageBucket: 'riverpodudemy1.appspot.com',
    iosBundleId: 'com.example.riverpodUdemy1',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDMX5Ishxgl9_UUnSBJuJsIgYxcPXoxd24',
    appId: '1:63143179779:web:9bf1142007ae361a1fc036',
    messagingSenderId: '63143179779',
    projectId: 'riverpodudemy1',
    authDomain: 'riverpodudemy1.firebaseapp.com',
    storageBucket: 'riverpodudemy1.appspot.com',
    measurementId: 'G-5K7ZL0LYJB',
  );
}
