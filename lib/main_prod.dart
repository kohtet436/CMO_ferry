import 'package:cmo_ferry/ferry_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'app/core/helper/app_prefs.dart';
import 'app/core/helper/di.dart';
import 'flavors.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey();
void main() async{
  FlavorConfig(
    flavor: Flavor.PROD,
    env: "PROD",
    name: "CMO Ferry",
    values: FlavorValues(
      bundleID: "mm.com.cmoit.cmo_ferry",
      appID: "mm.com.cmoit.cmo_ferry",
      emsBaseUrl: "https://apiemployee.fms.stg.citymall.com.mm",
      rmsBaseUrl: "https://apiroute.fms.stg.citymall.com.mm",
    ),
  );

  await initAppModule();
  initializeDateFormatting();
  GetStorage().write("isMM",false);
  instance.get<AppPreference>().getAppLanguage();

  runApp(const FerryApp());
}
