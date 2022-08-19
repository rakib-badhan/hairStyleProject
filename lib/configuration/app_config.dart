/*
    Created by Shitab Mir on 15 August 2022
    shitabmir@gmail.com
 */
import 'package:flutter/widgets.dart';
import 'package:flutter_flavor/flutter_flavor.dart';

class AppConfig {
  static String appName = 'Hair Styles App';

  static getFlavorConfiguration(
      {required bool isDevelopment, required bool testing, required String appVersionCode}) {
    return isDevelopment
        ? FlavorConfig(
      name: "DEBUG",
      location: BannerLocation.bottomEnd,
      variables: {
        "appName": '$appName - Dev',
        "appVersionCode": 'Dev-$appVersionCode',
        "baseUrl": "http://thebase.com/api/", // todo
        "applicationId": "edu.smir.straightas.dev",
        "googleAdsId": "ca-app-pub-... kichu ekta",

        "test": "$testing"
      },
    )
        : FlavorConfig(
      name: "PROD",
      variables: {
        "appName": appName,
        "appVersionCode": appVersionCode,
        "baseUrl": "http://thebase.com/api/", // todo
        "applicationId": "edu.smir.straightas.dev",
        "googleAdsId": "ca-app-pub-... kichu ekta",

        "test": "$testing"
      },
    );
  }

}