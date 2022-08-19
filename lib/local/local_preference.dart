/*
    Created by Shitab Mir on 15 August 2022
    shitabmir@gmail.com
 */

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalPreference {
  static Future<String?> getValue(String key) async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    String? value = '';
    try {
      value = storage.getString(key);
    } on Exception {
      print('custom exception is been obtained');
    }
    return value;
  }

  static Future<bool> setValue(String key, String? value) async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    bool saved = false;

    try {
      storage.setString(key, value!);
      saved = true;
    } on Exception {
      print('custom exception is been obtained');
    }

    return saved;
  }

  static Future<bool> setBool(String key, bool value) async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    bool saved = false;
    try {
      storage.setString(key, value.toString());
      saved = true;
    } on Exception {
      print('custom exception is been obtained');
    }
    return Future<bool>.value(saved);
  }

  static Future<bool> getBool(String key) async {
    bool hasValue = false;
    try {
      final String? value = await LocalPreference.getValue(key);
      hasValue = value.toString().toLowerCase() == "true" ? true : false;
    } on Exception {
      print('custom exception is been obtained');
    }
    return Future<bool>.value(hasValue);
  }

  static Future<bool> isLoggedIn() async {
    bool loggedIn = false;
    try {
      final String? token = await getValue(LocalPreferenceKeys.PREF_KEY_REMEMBER_TOKEN);
      final bool isLoggedIn = await getBool(LocalPreferenceKeys.PREF_KEY_IS_LOGGED_IN);
      if (token != null && token != "" && isLoggedIn) {
        loggedIn = true;
      }
    } on Exception catch (e) {
      print(e);
    }
    return Future<bool>.value(loggedIn);
  }

  static Future<bool> logout(BuildContext context) async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    bool saved = false;
    try {
      LocalPreference.getValue(LocalPreferenceKeys.PREF_KEY_USER_ID)
          .then((savedUserId) async {
        if (savedUserId != null && savedUserId != "") {
          //Unsubscribe
        }
        await storage.clear();

        saved = true;
      });
    } on Exception catch (e) {
      print(e);
    }
    return saved;
  }

}

class LocalPreferenceKeys {
  /// Keys
  // Log In
  static const String PREF_KEY_REMEMBER_TOKEN = "user_remember_token";
  static const String PREF_KEY_IS_LOGGED_IN = "user_logged_in";

  // User Info
  static const String PREF_KEY_USER_ID = "user_id";
  static const String PREF_KEY_USER_NAME = "user_name";
  static const String PREF_KEY_USER_PHONE_NO = "user_phone_no";
}