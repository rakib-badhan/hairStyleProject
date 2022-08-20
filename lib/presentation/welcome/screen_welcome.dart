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
      body: Stack(
        children: [
          // Background Image
          Center(
            child: Image.asset(
              Images.instance.welcome01,
              scale: 1,
            ),
          ),
          // Texts
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: const [
                Text(
                  "Welcome",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 60
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Text(
                    "Lorem Ipsum is Simply Dummy Text",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Continue Button
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 45.0),
            child: Align(
              alignment: AlignmentDirectional.bottomCenter,
              child: SizedBox(
                height: 60,
                width: 250,
                child: ElevatedButton(
                    onPressed:()=> _viewmodel?.goToNextScreen(context),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.black),
                    ),
                    child: const Text(
                      "Continue",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22
                      ),
                    )
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

}