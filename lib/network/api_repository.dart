/*
    Created by Shitab Mir on 15 August 2022
    shitabmir@gmail.com
 */

import 'package:flutter/cupertino.dart';
import 'package:hairstylesapp/presentation/signup/response_signup.dart';
import '../presentation/login/response_login.dart';
import 'api_urls.dart';
import 'rest_client.dart';

class ApiRepository {

  /// Login API
  void postLogIn(BuildContext context, Map<String, dynamic>? data, {void Function(LoginResponse)? onSuccess,
    void Function(String)? onFailure}) async {
    try {
      final response = await ApiClient.post(ApiUrls.baseUrl +ApiUrls.loginPath, null, data, false);
      LoginResponse callResponse = LoginResponse.fromJson(response);
      if(callResponse != null) {
        onSuccess!(callResponse);
      } else {
        onFailure!("Something went wrong!");
      }
    } catch (e) {
      onFailure!(e.toString());
    }
  }

  /// Sign up
  void postSignUp(BuildContext context, Map<String, dynamic>? data, {void Function(SignupResponse)? onSuccess,
    void Function(String)? onFailure}) async {
    try {
      final response = await ApiClient.post(ApiUrls.baseUrl +ApiUrls.registerPath, null, data, false);
      SignupResponse callResponse = SignupResponse.fromJson(response);
      if(callResponse != null) {
        onSuccess!(callResponse);
      } else {
        onFailure!("Something went wrong!");
      }
    } catch (e) {
      onFailure!(e.toString());
    }
  }

}