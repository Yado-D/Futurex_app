import 'dart:convert';

import 'package:futurex/services/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageServices {
  late SharedPreferences _prefs;
  Future<StorageServices> init() async {
    _prefs = await SharedPreferences.getInstance();
    return this;
  }

  Future<bool> setDeviceOpenedFirst(String key, bool value) async {
    return await _prefs.setBool(key, value);
  }

  bool GetDeviceFirstOpen() {
    return _prefs.getBool(AppConstants.STORAGE_DEVICE_OPENED_FIRST) ?? false;
  }

  Future<bool> setNotificationSchedule(String key, bool value) async {
    return await _prefs.setBool(key, value);
  }

  bool getNotificationSchedule() {
    return _prefs.getBool("isTimerCreated") ?? false;
  }

  Future<bool> setNotificationSettings(String key, bool value) async {
    return await _prefs.setBool(key, value);
  }

  bool getNotificationSettings() {
    return _prefs.getBool("notificationAllowed") ?? true;
  }

Future<void> saveUserData(String key, String value) async {
  await _prefs.setString(key,value);
}

String getUserData(String key) {
  return _prefs.getString(key) ?? "Username";
}



  // Future<void> saveUserData(String key, UserData value) async {
  //   await _prefs.setString(key, jsonEncode(value.toJson()));
  // }

  // UserData? getUserData(String key) {
  //   String? jsonString = _prefs.getString(key);
  //   if (jsonString != null) {
  //     return UserData.fromJson(jsonDecode(jsonString));
  //   }
  //   return null;
  // }
}
