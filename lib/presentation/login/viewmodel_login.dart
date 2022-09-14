/*
    Created by Shitab Mir on 29 August 2022
 */

import 'package:hairstylesapp/app/util.dart';
import 'package:hairstylesapp/network/api_repository.dart';
import 'package:flutter/widgets.dart';
import 'package:hairstylesapp/app/nav.dart';
import 'package:hairstylesapp/presentation/homepage/screen_homepage.dart';
import 'package:hairstylesapp/presentation/login/response_login.dart';
import 'package:hairstylesapp/presentation/signup/screen_signup.dart';

class LoginScreenViewModel {
  BuildContext context;
  ApiRepository? _apiRepository;

  LoginScreenViewModel(this.context) {
    _apiRepository = ApiRepository();
  }

  /// Login Button Press Action
  void loginButtonPress(String email, String password) async {
    if (!CommonUtil.instance.isRedundantClick(DateTime.now())) {
      if (await CommonUtil.instance.internetCheck()) { // has internet

        if (email.isEmpty || password.isEmpty) { // validation
          CommonUtil.instance.showToast(context, 'Enter both Email & Password');
        } else {
          _loginCall(_getMappedDynamicData(email, password));
        }
      } else {
        CommonUtil.instance.showToast(context, 'No Internet');
      }
    }
  }

  void _loginCall(Map<String, dynamic> data) {
    CommonUtil.instance.showLoading();
    _apiRepository?.postLogIn(context, data,
        onSuccess: (LoginResponse response) {
          CommonUtil.instance.stopLoading();
          if(response.success != null && response.success == true && response.token != null) {
            Nav.goToNextScreenDestroyingPrevious(context, const HomepageScreen());
          }

        },
      onFailure: (String error) {
        CommonUtil.instance.stopLoading();
        CommonUtil.instance.onFailed(error);
      }
    );
    // Nav.goToNextScreenDestroyingPrevious(context, LoginScreen());

  }

  void goToForgotPasswordScreen() {
    // Nav.goToNextScreenDestroyingPrevious(context, LoginScreen());

  }

  void goToSignUpScreen() {
    Nav.goToNextScreen(context, const SignUpScreen(), null);
  }

  Map<String, dynamic> _getMappedDynamicData(String email, String password) {
    Map<String, dynamic> data = {};
    /// Email
    data["email"] = email;
    /// Password
    data["password"] = password;

    return data;
  }

}