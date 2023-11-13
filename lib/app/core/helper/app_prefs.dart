import 'dart:ui';

import 'package:cmo_ferry/app/core/helper/constant.dart';

import 'app_enum.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/state_manager.dart';
import 'package:get_storage/get_storage.dart';

import 'helper.dart';

const String PREFS_KEY_LANG = "PREFS_KEY_LANG";
const String PREFS_KEY_ACCESS_TOKEN = "PREFS_KEY_ACCESS_TOKEN";
const String PREFS_KEY_VERSION = "PREFS_KEY_VERSION";
const String PREFS_BASEROUTE_ID="PREFS_BASEROUTE_ID";
const String PREFS_DAILYROUTE_ID="PREFS_DAILYROUTE_ID";


class AppPreference {
  final GetStorage _sharedPreferences;
  final FlutterSecureStorage _secureStorage;

  AppPreference(this._sharedPreferences, this._secureStorage);

  void setAppLanguage(AppLanguage appLanguage) {
    _sharedPreferences.write(PREFS_KEY_LANG, appLanguage.toString());
  }

  Locale getAppLanguage() {
    String language = _sharedPreferences.read(PREFS_KEY_LANG) ?? AppLanguage.ENG.toString();
    if (language == AppLanguage.MM.toString())
    {
      return MM_LOCALE;
    }else {
      return ENG_LOCALE;
    }
  }

  void setAccessToken(String accessToken) {
    _sharedPreferences.write( PREFS_KEY_ACCESS_TOKEN, "Bearer $accessToken");
  }

  String getAccessToken() {
    final token = _sharedPreferences.read(PREFS_KEY_ACCESS_TOKEN);
    Helper.console(token ?? "token is null");
    return token ?? "";
  }

  void setAppVersion(String version) {
    _sharedPreferences.write(PREFS_KEY_VERSION, version);
  }

  String getAppVersionNumber() {
    return _sharedPreferences.read(PREFS_KEY_VERSION) ?? "";
  }
 void setBaseRouteId(String baseRouteId) {
    _sharedPreferences.write(PREFS_BASEROUTE_ID, baseRouteId);
  }

  String getBaseRouteId() {
    return _sharedPreferences.read(PREFS_BASEROUTE_ID) ?? "";
  }
   void setDailyRouteId(String dailyRouteId) {
    _sharedPreferences.write(PREFS_DAILYROUTE_ID, dailyRouteId);
  }

  String getDailyRouteId() {
    return _sharedPreferences.read(PREFS_BASEROUTE_ID) ?? "";
  }





  void deleteAppData() {
    String versionNo = getAppVersionNumber();
    _sharedPreferences.remove(PREFS_KEY_ACCESS_TOKEN);
    _secureStorage.delete(key: PREFS_KEY_ACCESS_TOKEN);
    setAppVersion(versionNo);
  }
}
