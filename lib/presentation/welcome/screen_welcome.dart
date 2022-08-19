/*
    Created by Shitab Mir on 15 August 2022
    shitabmir@gmail.com
 */
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hairstylesapp/app/images.dart';
import 'package:hairstylesapp/app/colors.dart';
import 'package:hairstylesapp/presentation/welcome/viewmodel_welcome.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {

  WelcomeScreenViewModel? _viewmodel;

  @override
  initState() {
    super.initState();
    _viewmodel = WelcomeScreenViewModel(context);
    // _viewmodel?.act(context);
  }

  @override
  void dispose() {
    _viewmodel = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.bottom]);
    return Scaffold(
      backgroundColor: MyColors.instance.welcomeBackground,
      body: Center(
        child: Image.asset(
          Images.instance.welcome01,
          scale: 1,
        ),
      ),
    );
  }

}