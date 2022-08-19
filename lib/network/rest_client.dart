/*
    Created by Shitab Mir on 15 August 2022
    shitabmir@gmail.com
 */

import 'dart:convert';
import 'dart:io';
import 'dart:io' as IO;
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:hairstylesapp/local/local_preference.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiClient {

  /// GET CALL
  static Future<dynamic> get(
      String url, dynamic parameters, bool isJWTRequired) async {
    try {
      Dio dio = await _dioClient(isJWTRequired);
      Response response = await dio.get(url, queryParameters: parameters);
      if (kDebugMode) {
        print(response);
      }
      return _response(response);
    } catch (e) {
      rethrow;
    }
  }

  /// GET CALL JS Object
  static Future<dynamic> getList(
      String url, dynamic parameters, bool isJWTRequired) async {
    try {
      Dio dio = await _dioClient(isJWTRequired);
      Response response = await dio.get(url, queryParameters: <String, dynamic>{});
      if (kDebugMode) {
        print(response);
      }
      return response.data;
      // return _response(response);
    } catch (e) {
      rethrow;
    }
  }

  /// POST CALL
  static Future<dynamic> post(
      String url, dynamic params, dynamic body, bool isJWTRequired) async {
    try {
      Dio dio = await _dioClient(isJWTRequired);
      Response response =
      await dio.post(url, queryParameters: params, data: body);
      return _response(response);
    } catch (e) {
      rethrow;
    }
  }

  /// UPDATE CALL
  static Future<dynamic> put(
      String url, dynamic params, dynamic body, bool isJWTRequired) async {
    try {
      Dio dio = await _dioClient(isJWTRequired);
      Response response =
      await dio.put(url, queryParameters: params, data: body);
      return _response(response);
    } catch (e) {
      rethrow;
    }
  }

  /// DELETE CALL
  static Future<dynamic> delete(
      String url, dynamic params, dynamic body, bool isJWTRequired) async {
    try {
      Dio dio = await _dioClient(isJWTRequired);
      Response response =
      await dio.delete(url, queryParameters: params, data: body);
      return _response(response);
    } catch (e) {
      rethrow;
    }
  }

  /// CLIENT
  static Future<Dio> _dioClient(bool isJWTRequired) async {
    String token = "";
    if (isJWTRequired) {
      token = (await LocalPreference.getValue(LocalPreferenceKeys.PREF_KEY_REMEMBER_TOKEN))!; //tba
    }
    Dio dio = Dio(await _options(token, isJWTRequired));
    // dio.interceptors.add(DioFirebasePerformanceInterceptor());

    if(FlavorConfig.instance.variables['test'] == 'true') {
      dio.interceptors.add(
          PrettyDioLogger(
              request: true,
              requestHeader: true,
              requestBody: true,
              responseBody: true,
              responseHeader: true,
              error: true,
              compact: true,
              maxWidth: 90
          )
      );
    }

    if(!kIsWeb){
      (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
          (IO.HttpClient client) {
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
        return client;
      };
    }
    return dio;
  }

  static Future<BaseOptions> _options(String token, bool isTokenRequired) async {
    String appName = FlavorConfig.instance.variables['appName'];
    String versionCode = FlavorConfig.instance.variables['appVersionCode'];

    var header = {
      'app-name': appName,
      'version-code': versionCode,
      'Accept': 'application/json',
    };

    if (isTokenRequired) {
      header['Authorization'] = 'Bearer $token';
    }

    return BaseOptions(
      connectTimeout: 50000,
      receiveTimeout: 50000,
      headers: header,
    );
  }

  /// Response Parser
  static dynamic _response(Response response) {
    var responseJson = json.decode(response.toString());
    return responseJson;
  }
  /// Response Parser for Javascript Object
  static dynamic _responseJS(Response response) {
    if (kDebugMode) {
      print(const JsonEncoder.withIndent(" ").convert(const JsonDecoder().convert(response.toString())));
    }
    return const JsonEncoder.withIndent(" ").convert(const JsonDecoder().convert(response.toString()));
    // return response;
  }

}