import 'package:freezed_annotation/freezed_annotation.dart';
part 'signin_state.freezed.dart';

@freezed
class Signinstate with _$Signinstate {
  factory Signinstate({
    @Default("") String email,
    @Default("") String password,
  }) = _Signinstate;
}
