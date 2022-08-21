/*
    Created by Shitab Mir on 21 August 2022
 */

import 'package:flutter_flavor/flutter_flavor.dart';

class ApiUrls {
  static final instance = ApiUrls();

  // static String dummyBaseUrl = "https://shitab14.github.io";
  static String baseUrl = FlavorConfig.instance.variables['baseUrl'];

  /// Paths
  static String loginPath = "/public/api/login";
  static String registerPath = "/public/api/register";
  static String logoutPath = "/public/api/logout";
  static String profilePath = "/public/api/profile";
  static String categoryPath = "/public/api/category";
  static String categoryStorePath = "/public/api/category/store";

}