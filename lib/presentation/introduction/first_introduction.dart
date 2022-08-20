/*
    Created by Shitab Mir on 20 August 2022
    shitabmir@gmail.com
 */
import 'package:flutter/material.dart';
import 'package:hairstylesapp/app/images.dart';

class FirstIntroduction extends StatelessWidget {
  const FirstIntroduction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 24),
            child: Image.asset(
              Images.instance.intro01,
              scale: 2,
            ),
          ),

          const Text(
            "Lorem Ipsum",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.black,
                fontSize: 30
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            child: Text(
              "Lorem Ipsum",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18
              ),
            ),
          ),
        ],
      ),
    );
  }

}