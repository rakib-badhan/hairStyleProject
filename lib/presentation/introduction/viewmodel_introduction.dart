/*
    Created by Shitab Mir on 20 August 2022
    shitabmir@gmail.com
 */
import 'package:flutter/cupertino.dart';
import 'package:hairstylesapp/app/nav.dart';
import 'package:hairstylesapp/presentation/login/screen_login.dart';
// import 'package:hairstylesapp/network/api_repository.dart';

class IntroductionScreenViewModel {
  BuildContext context;
  // ApiRepository? _apiRepository;

  IntroductionScreenViewModel(this.context) {
    // _apiRepository = ApiRepository();
  }

  void goToNextScreen(BuildContext context) {
    Nav.goToNextScreenDestroyingPrevious(context, LoginScreen());

  }

}