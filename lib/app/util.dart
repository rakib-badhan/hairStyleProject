/*
    Created by Shitab Mir on 29 August 2022
 */

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class CommonUtil {
  static final instance = CommonUtil();

  /// Internet Check
  Future<bool> internetCheck() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      return false;
    }
    return true;
  }

  /// Show Toast
  void showToast(BuildContext context, String msg) {
    dismissToast(context);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 2),
        content: Text(msg),
      ),
    );
  }

  void dismissToast(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();
  }

  /// Handle Over-tapping
  DateTime? initialClickTime;
  bool isRedundantClick(DateTime currentTime){
    if(initialClickTime==null){
      initialClickTime = currentTime;
      return false;
    } else {
      if (currentTime
          .difference(initialClickTime!)
          .inSeconds < 3) { //set this difference time in seconds
        return true;
      }
    }
    initialClickTime = currentTime;
    return false;
  }

  /// Loader Behavior
  void showLoading() {
    EasyLoading.show(status: 'Loading',
        dismissOnTap: false,
        maskType: EasyLoadingMaskType.black);
  }

  void stopLoading() {
    EasyLoading.dismiss(animation: true);
  }

  void onNoInternet() {
    EasyLoading.show(status: "No Internet!",
      indicator: const Icon(Icons.signal_cellular_connected_no_internet_4_bar,
        color: Colors.white70,),
      dismissOnTap: true,
      maskType: EasyLoadingMaskType.black,
    );
  }

  Future onSuccessfulEntry(String? successMessage) async{
    EasyLoading.show(status: successMessage!,
      indicator: const Icon(Icons.check,
        color: Colors.white70,),
      dismissOnTap: true,
      maskType: EasyLoadingMaskType.black,
    );
  }

  void onFailed(String failedMsg) {
    EasyLoading.show(status: failedMsg,
        indicator: const Icon(Icons.sms_failed_outlined, color: Colors.white70,),
        dismissOnTap: true,
        maskType: EasyLoadingMaskType.black);
  }

  void onEasyMsg(String failedMsg) {
    EasyLoading.show(status: failedMsg,
        indicator: const Icon(Icons.add_to_home_screen, color: Colors.white70,),
        dismissOnTap: true,
        maskType: EasyLoadingMaskType.black);
  }

  /*void onFailedNoDismiss(String failedMsg) {
    EasyLoading.show(status: failedMsg, indicator: Image.asset(AppImages.instance.errorIcon), dismissOnTap: false, maskType: EasyLoadingMaskType.black);
  }*/

}