import 'dart:convert';

import 'package:riverpod_udemy1/features/common/Entities/entities.dart';
import 'package:riverpod_udemy1/features/common/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  late final SharedPreferences _pref;

  Future<StorageService> init() async {
    _pref = await SharedPreferences.getInstance();
    return this;
  }

  Future<bool> setbool(String key, bool value) async {
    return await _pref.setBool(key, value);
  }

  Future<bool> setString(String key, String value) async {
    return await _pref.setString(key, value);
  }

  String getstring(String key) {
    return _pref.getString(key) ?? "";
  }

  bool getDeviceFirstOpen() {
    return _pref.getBool(AppConstants.storageDeviceOpenFirstKey) ?? false;
  }

  bool isloggedin() {
    return _pref.getString(AppConstants.storageUserProfilekey) != null
        ? true
        : false;
  }

  UserProfile getUserProfile() {
    var profile = _pref.getString(AppConstants.storageUserProfilekey) ?? "";
    var profileJson = jsonDecode(profile);
    var userProfile = UserProfile.fromJson(profileJson);
    return userProfile;
  }
}
