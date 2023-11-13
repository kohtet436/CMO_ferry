import 'dart:io';

import 'package:alice/alice.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'app/core/helper/app_prefs.dart';
import 'app/core/helper/di.dart';
import 'app/core/util/language.dart';
import 'app/routes/app_pages.dart';
import 'ferry_app.dart';
import 'flavors.dart';

void main() async {
  FlavorConfig(
    flavor: Flavor.STAGING,
    env: "STAGING",
    name: "Staging CMO Ferry",
    values: FlavorValues(
      bundleID: "mm.com.cmoit.cmo_ferry.staging",
      appID: "mm.com.cmoit.cmo_ferry.staging",
      emsBaseUrl: "https://apiemployee.fms.stg.citymall.com.mm",
      rmsBaseUrl: "https://apiroute.fms.dev.citymall.com.mm/",
    ),
  );
  WidgetsFlutterBinding.ensureInitialized();
  await initAppModule();
  initializeDateFormatting();
  instance.get<AppPreference>().getAppLanguage();

  runApp(FerryApp());
}


// class FerryAppStaging extends StatelessWidget {
//   const FerryAppStaging({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       translations: Languages(),
//       locale: instance.get<AppPreference>().getAppLanguage(),
//       fallbackLocale: const Locale('en','MM'),title: "CMO Ferry Application",
//       debugShowCheckedModeBanner: false,
//       navigatorKey: alice.getNavigatorKey(),
//       theme: ThemeData(),
//       initialRoute: AppPages.INITIAL,
//       getPages: AppPages.routes,
//     );
//   }
//
// }