/*
    Created by Shitab Mir on 20 August 2022
    shitabmir@gmail.com
 */
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hairstylesapp/app/images.dart';
import 'package:hairstylesapp/app/colors.dart';
import 'package:hairstylesapp/presentation/introduction/first_introduction.dart';
import 'package:hairstylesapp/presentation/introduction/second_introduction.dart';
import 'package:hairstylesapp/presentation/introduction/third_introduction.dart';
import 'package:hairstylesapp/presentation/introduction/viewmodel_introduction.dart';

class IntroductionScreen extends StatefulWidget {
  const IntroductionScreen({Key? key}) : super(key: key);

  @override
  IntroductionScreenState createState() => IntroductionScreenState();
}

class IntroductionScreenState extends State<IntroductionScreen> with SingleTickerProviderStateMixin{

  IntroductionScreenViewModel? _viewmodel;
  TabController? tabController;
  PageController? pageController;
  @override
  initState() {
    super.initState();
    _viewmodel = IntroductionScreenViewModel(context);
    tabController = TabController(
        length: 3,
        vsync: this
    );
    pageController = PageController(
      initialPage: 0,
    );
    tabController?.index = 0;
  }

  @override
  void dispose() {
    _viewmodel = null;
    tabController?.dispose();
    pageController?.dispose();
    super.dispose();
  }

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

              // View Pager
              Padding(
                padding: const EdgeInsets.only(bottom: 30.0),
                child: PageView(
                  controller: pageController,
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  onPageChanged: (int position) => _onPageChange(position),
                  children: const [
                    FirstIntroduction(),
                    SecondIntroduction(),
                    ThirdIntroduction(),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(bottom: 70),
                child: Align(
                  alignment: AlignmentDirectional.bottomCenter,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TabPageSelector(
                        controller: tabController,
                        selectedColor: Colors.black,
                      ),

                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Visibility(
                          visible: (tabController?.index == tabController!.length-1),
                          child: ElevatedButton(
                              onPressed:()=> _viewmodel?.goToNextScreen(context),
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(Colors.black),
                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(18.0),
                                          side: const BorderSide(color: Colors.black)
                                      )
                                  )
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Text(
                                  "Get Started",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24
                                  ),
                                ),
                              )
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )

            ]
        )
    );
  }

  void _onPageChange(int position) {
    setState(() {
      tabController?.index = position;
    });
  }

}