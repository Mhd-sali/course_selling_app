import 'package:firebase_auth/firebase_auth.dart';

class SigninRepo {
  static Future<UserCredential> firebaselogIn(
      String email, String password) async {
    final credential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    return credential;
  }
}
