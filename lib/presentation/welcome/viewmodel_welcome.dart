/*
    Created by Shitab Mir on 15 August 2022
    shitabmir@gmail.com
 */
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:hairstylesapp/app/nav.dart';
import 'package:hairstylesapp/local/local_preference.dart';
import 'package:hairstylesapp/network/api_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WelcomeScreenViewModel {
  BuildContext context;
  ApiRepository? _apiRepository;

  WelcomeScreenViewModel(this.context) {
    _apiRepository = ApiRepository();
  }

  Future<bool> getUserLoggedIn() async {
    String? token = await getUserToken();
    if(token != null && token != '') {
      return true;
    } else {
      return false;
    }
  }

  Future<String?> getUserToken() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(LocalPreferenceKeys.PREF_KEY_REMEMBER_TOKEN);
  }

/*
  Future<void> act(BuildContext context) async {
    if (await getUserLoggedIn()) {
      Timer(
        const Duration(seconds: 3),
            () => Nav.goToNextScreenDestroyingPrevious(context, HomeLandingScreen()),
      );
    } else {
      Timer(
        const Duration(seconds: 3),
            () => Nav.goToNextScreenDestroyingPrevious(context, OpeningScreenPage()),
      );
    }
  }
*/



}