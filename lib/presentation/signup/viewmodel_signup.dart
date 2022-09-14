/*
    Created by Shitab Mir on 14 September 2022
 */

import 'package:flutter/widgets.dart';
import 'package:hairstylesapp/app/util.dart';
import 'package:hairstylesapp/network/api_repository.dart';
import 'package:hairstylesapp/presentation/login/screen_login.dart';
import 'package:hairstylesapp/presentation/signup/response_signup.dart';

import '../../app/nav.dart';

class SignupScreenViewModel {
  BuildContext context;
  ApiRepository? _apiRepository;

  SignupScreenViewModel(this.context) {
    _apiRepository = ApiRepository();
  }

  /// Login Button Press Action
  void signupButtonPress(String name, String email, String password, String gender) async {
    if (!CommonUtil.instance.isRedundantClick(DateTime.now())) {
      if (await CommonUtil.instance.internetCheck()) { // has internet

        if (email.isEmpty || password.isEmpty) { // validation
          CommonUtil.instance.showToast(context, 'Enter both Email & Password');
        } else {
          _signupCall(_getMappedDynamicData(name, email, password, gender));
        }
      } else {
        CommonUtil.instance.showToast(context, 'No Internet');
      }
    }
  }

  Map<String, dynamic> _getMappedDynamicData(String name, String email, String password, String gender) {
    Map<String, dynamic> data = {};
    /// Name
    data["name"] = name;
    /// Email
    data["email"] = email;
    /// Password
    data["password"] = password;
    // Gender
    data["gender"] = gender;

    return data;
  }

  void _signupCall(Map<String, dynamic> getMappedDynamicData) {
    CommonUtil.instance.showLoading();
    _apiRepository?.postSignUp(context, getMappedDynamicData,
        onSuccess: (SignupResponse response) {
          CommonUtil.instance.stopLoading();
          if(response.success != null && response.success == true) {
            CommonUtil.instance.onSuccessfulEntry("Account Created Successfully");
            Nav.goToNextScreenDestroyingPrevious(context, const LoginScreen());
          }

        },
        onFailure: (String error) {
          CommonUtil.instance.stopLoading();
          CommonUtil.instance.onFailed(error);
        }
    );
  }

}