import 'package:cmo_ferry/ferry_app.dart';
import 'package:cmo_ferry/app/core/helper/constant.dart';
import 'package:cmo_ferry/app/core/helper/di.dart';
import 'package:cmo_ferry/app/core/util/language.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'app/core/helper/app_prefs.dart';
import 'app/core/values/color_manager.dart';
import 'app/routes/app_pages.dart';

// void main() async {
//   await initAppModule();
//   initializeDateFormatting();
//   GetStorage().write("isMM",false);
//   instance.get<AppPreference>().getAppLanguage();
//
//   runApp(
//     GetMaterialApp(
//       translations: Languages(),
//       locale: instance.get<AppPreference>().getAppLanguage(),
//       fallbackLocale: const Locale('en'),title: "CMO Ferry Application",
//       debugShowCheckedModeBanner: false,
//       navigatorKey: Get.key,
//       theme: ThemeData(),
//       initialRoute: AppPages.INITIAL,
//       getPages: AppPages.routes,
//     ),
//   );
// }

import 'flavors.dart';

void main() async {
  // GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  FlavorConfig(
    flavor: Flavor.STAGING,
    env: "STAGING",
    name: "Staging CMO Ferry",
    values: FlavorValues(
      bundleID: "mm.com.cmoit.cmo_ferry.staging",
      appID: "mm.com.cmoit.cmo_ferry.staging",
      emsBaseUrl: "https://apiemployee.fms.dev.citymall.com.mm",
      rmsBaseUrl: "https://apiroute.fms.dev.citymall.com.mm",
    ),
  );
  await initAppModule();
  initializeDateFormatting();
  GetStorage().write("isMM", false);
  instance.get<AppPreference>().getAppLanguage();

  runApp(FerryApp());
}
