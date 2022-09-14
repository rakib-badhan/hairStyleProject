/*
    Created by Shitab Mir on 31 August 2022
 */

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hairstylesapp/app/colors.dart';
import 'package:hairstylesapp/app/images.dart';
import 'package:hairstylesapp/app/util.dart';
import 'package:hairstylesapp/presentation/signup/viewmodel_signup.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  SignUpScreenState createState() => SignUpScreenState();

}

class SignUpScreenState extends State<SignUpScreen> {

  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController =  TextEditingController();
  ValueNotifier _passwordVisible = ValueNotifier(false);
  final List<String> _genderList = ["Male", "Female", "Others"];
  String _genderDropdownValue = "Select Gender";

  SignupScreenViewModel? _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = SignupScreenViewModel(context);
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _passwordVisible.dispose();
    EasyLoading.dismiss();
    _viewModel = null;
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
                      _getNameField(),
                      _getEmailField(),
                      _getPasswordField(),
                      _getGenderDropdown(),
                      // Buttons
                      _getSignUpButton(),
                    ],
                  ),
                ),
              ),

            ]
        )
    );
  }

  Widget _getNameField() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 50),
      child: Container(
        color: Colors.white,
        child: TextFormField(
          controller: _nameController,
          keyboardType: TextInputType.name,
          /*style: TextStyle(
            color: AppColors.instance.blueTextColor,
          ),*/
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Name',
          ),
        ),
      ),
    );
  }

  Widget _getEmailField() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
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
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
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

  Widget _getSignUpButton() {
    return Padding(
      padding: const EdgeInsets.only(
          left: 20, right: 20, top: 20, bottom: 30),
      child: ElevatedButton(
        onPressed: _signup,
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
              "Sign Up",
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.white, fontSize: 18
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _getGenderDropdown() {
    return Padding(
      padding: const EdgeInsets.only(
          left: 20, right: 20, top: 20, bottom: 30),
      child: Container(
        color: Colors.white,
        child: SizedBox(
          width: double.infinity,
          child: PopupMenuButton<String>(
            initialValue: "",
            onSelected: (String value) => _selectedGender(value),
            itemBuilder: (BuildContext context) {
              return _genderList.skip(0).map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(
                    choice,
                    overflow: TextOverflow.visible,
                    textAlign: TextAlign.left,
                  ),
                );
              }).toList();
            },
            child: Container(
              padding: EdgeInsets.all(10.w),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: MyColors.instance.statusBarColor,
                  )
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text(
                      _genderDropdownValue,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: MyColors.instance.statusBarColor,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                  ),
                  Icon(
                    Icons.arrow_drop_down,
                    color: Colors.black54,
                    size: 20.sp,
                  ),
                ],
              ),
            ),

          ),
        ),
      ),
    );
  }

  void _signup() {
    if (_passwordController.text.length > 6) {
      _viewModel?.signupButtonPress(
          _nameController.text.toString(), _emailController.text.toString(),
          _passwordController.text.toString(), _genderDropdownValue);
    } else {
      CommonUtil.instance.showToast(context, "The password must be at least 6 characters.");
    }
  }

  _selectedGender(String value) {
    _genderDropdownValue = value;
    setState(() {

    });
  }

}