import 'package:freezed_annotation/freezed_annotation.dart';

part 'registernotifier.freezed.dart';

@freezed
class RegisterModel with _$RegisterModel {
  factory RegisterModel({
    @Default("") String username,
    @Default("") String password,
    @Default("") String repassword,
    @Default("") String email,
  }) = _RegisterModel;
}
