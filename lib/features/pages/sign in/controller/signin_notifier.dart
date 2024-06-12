import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_udemy1/features/pages/sign%20in/model/signin_state.dart';
part 'signin_notifier.g.dart';

@riverpod
class SigninNotifier extends _$SigninNotifier {
  @override
  Signinstate build() {
    return Signinstate();
  }

  void onEmailChange(String email) {
    state = state.copyWith(email: email);
  }

  void onPasswordChange(String password) {
    state = state.copyWith(password: password);
  }
}
