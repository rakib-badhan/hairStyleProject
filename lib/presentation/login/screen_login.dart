/*
    Created by Shitab Mir on 28 August 2022
 */

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hairstylesapp/app/colors.dart';
import 'package:hairstylesapp/app/images.dart';
import 'package:hairstylesapp/presentation/login/viewmodel_login.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  LoginScreenState createState() => LoginScreenState();

}

class LoginScreenState extends State<LoginScreen> {

  LoginScreenViewModel? _viewModel;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController =  TextEditingController();
  ValueNotifier _passwordVisible = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
    _viewModel = LoginScreenViewModel(context);
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _emailController.dispose();
    _passwordVisible.dispose();
    EasyLoading.dismiss();
    _viewModel = null;
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
          Image.asset(
            Images.instance.intro,
            scale: 1,
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.fill,
          ),

          // Body
          Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  // Image
                  SizedBox(
                    width: 60,
                    height: 60,
                    child: Image.asset(
                      Images.instance.login01,
                      scale: 2,
                    ),
                  ),

                  // Fields
                  _getEmailField(),
                  _getPasswordField(),
                  // Buttons
                  _getLoginButton(),
                  _signUpAndForgetPassword(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _getEmailField() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 50),
      child: Container(
        color: Colors.white,
        child: TextFormField(
          controller: _emailController,
          keyboardType: TextInputType.emailAddress,
          /*style: TextStyle(
            color: AppColors.instance.blueTextColor,
          ),*/
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Email',
          ),
        ),
      ),
    );
  }

  Widget _getPasswordField() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
      child: Container(
        color: Colors.white,
        child: TextFormField(
          controller: _passwordController,
          keyboardType: TextInputType.text,
          obscureText: !_passwordVisible.value,
          obscuringCharacter: '*',
          /*style: TextStyle(
            color: AppColors.instance.blueTextColor,
          ),*/
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            hintText: 'Password',
            suffixIcon: IconButton(
              icon: Icon(
                _passwordVisible.value
                    ? Icons.visibility
                    : Icons.visibility_off,
                // color: AppColors.instance.blueTextColor,
              ),
              onPressed: () {
                // CommonUtil.instance.hideKeyboard(context);
                _passwordVisible.value = !_passwordVisible.value;
              },
            ),

          ),
        ),
      ),
    );
  }

  Widget _getLoginButton() {
    return ElevatedButton(
      onPressed: _login,
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all(const Size(200, 60)),
        backgroundColor: MaterialStateProperty.all(MyColors.instance.buttonColor),
        padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
        textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 18)),
        shape:  MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(45.0))),
      ),
      child: const Padding(
        padding: EdgeInsets.all(10.0),
        child: FittedBox(
          child: Text(
            "Login",
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white, fontSize: 18
            ),
          ),
        ),
      ),
    );
  }

  Widget _signUpAndForgetPassword() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical:20, horizontal: 20),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextButton(
              onPressed: _signup,
              child: const Text(
                "Sign up",
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.grey, fontSize: 14
                ),
              )
          ),
          TextButton(
              onPressed: _forgotPassword,
              child: const Text(
                "Forgot Password?",
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.grey, fontSize: 14
                ),
              )
          )
        ],
      ),
    );

  }

  void _login() {
    _viewModel?.loginButtonPress(_emailController.text.toString(), _passwordController.text.toString());
  }

  void _forgotPassword() {
    // SHITAB TODO
  }


  void _signup() {
    _viewModel?.goToSignUpScreen();
  }

}