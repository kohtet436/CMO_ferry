import 'dart:io';

import 'package:alice/alice.dart';
import 'package:cmo_ferry/ferry_app.dart';
import 'package:cmo_ferry/flavors.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../../main_staging.dart';
import '../../core/helper/app_prefs.dart';
import '../../core/helper/helper.dart';
const String APPLICATION_JSON = "application/json";
const String CONTENT_TYPE = "Content-Type";
const String ACCEPT = "Accept";
const String AUTHORIZATION = "Authorization";
const String DEFAULT_LANGUAGE = "language";

class DioFactory{
  static Alice alice = Alice(
    showNotification: Platform.isAndroid,
    showInspectorOnShake: Platform.isAndroid,

  );
  String? token=GetStorage().read('token').toString();
  final AppPreference _appPreference;

  DioFactory(this._appPreference);

  Dio getEmsDio() {
    Dio dio = Dio();
    int timeOut = 60 * 1000; // 1 min
    Map<String, String?> headers = {
      CONTENT_TYPE: APPLICATION_JSON,
      ACCEPT: APPLICATION_JSON,
      AUTHORIZATION:'Bearer $token',
      //  _appPreference.getAccessToken(),
    };

    dio.options = BaseOptions(
      baseUrl: FlavorConfig.instance!.values!.emsBaseUrl ?? "",
      connectTimeout: timeOut,
      receiveTimeout: timeOut,
      validateStatus: (statusCode) => true,
      headers: headers,
    );

    if (Helper.showLog) {
      alice.showInspector();
      dio.interceptors.add(alice.getDioInterceptor());

      if (kReleaseMode) {
        debugPrint("release mode no logs");
      } else {
        dio.interceptors.add(
          PrettyDioLogger(
            requestHeader: true,
            requestBody: true,
            responseHeader: true,
          ),
        );
      }
    }

    return dio;
  }

  Dio getRmsDio() {
    Dio dio = Dio();
    int timeOut = 60 * 1000; // 1 min
    Map<String, String> headers = {
      AUTHORIZATION: _appPreference.getAccessToken(),
    };

    dio.options = BaseOptions(
      baseUrl: FlavorConfig.instance!.values!.rmsBaseUrl ?? "",
      connectTimeout: timeOut,
      receiveTimeout: timeOut,
      validateStatus: (statusCode) => true,
      headers: headers,
    );

    if (Helper.showLog) {
      dio.interceptors.add(alice.getDioInterceptor());

      if (kReleaseMode) {
        debugPrint("release mode no logs");
      } else {
        dio.interceptors.add(
          PrettyDioLogger(
            requestHeader: true,
            requestBody: true,
            responseHeader: true,
          ),
        );
      }
    }

    return dio;
  }
}
