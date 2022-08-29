/*
    Created by Shitab Mir on 29 August 2022
 */

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hairstylesapp/app/colors.dart';
import 'package:hairstylesapp/app/images.dart';

class HomepageScreen extends StatefulWidget {
  const HomepageScreen({Key? key}) : super(key: key);

  @override
  HomepageScreenState createState() => HomepageScreenState();

}

class HomepageScreenState extends State<HomepageScreen> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(
        SystemUiMode.manual, overlays: [SystemUiOverlay.bottom]);
    return Scaffold(
        backgroundColor: MyColors.instance.welcomeBackground,
        body: Stack(
            children: [
              // Background Image
              Image.asset(
                Images.instance.intro,
                scale: 1,
                height: double.infinity,
                width: double.infinity,
                fit: BoxFit.fill,
              ),
            ]
        )
    );
  }

}