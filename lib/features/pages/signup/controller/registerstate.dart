import 'package:riverpod_udemy1/features/pages/signup/model/register_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'registerstate.g.dart';

@riverpod
class RegNOt extends _$RegNOt {
  @override
  RegisterModel build() {
    return RegisterModel();
  }

  void onUsernameChange(String name) {
    state = state.copyWith(username: name);
  }

  void onEmailChange(String email) {
    state = state.copyWith(email: email);
  }

  void onPasswordChange(String password) {
    state = state.copyWith(password: password);
  }

  void onRepasswordChange(String repassword) {
    state = state.copyWith(repassword: repassword);
  }
}
