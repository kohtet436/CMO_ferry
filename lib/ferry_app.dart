import 'package:alice/alice.dart';
import 'package:cmo_ferry/app/data/remote/dio_factory.dart';
import 'package:cmo_ferry/main_staging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/core/helper/app_prefs.dart';
import 'app/core/helper/di.dart';
import 'app/core/util/language.dart';
import 'app/routes/app_pages.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey();
class FerryApp extends StatefulWidget {
  const FerryApp({super.key});

  @override
  State<FerryApp> createState() => _FerryAppState();
}

class _FerryAppState extends State<FerryApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: Languages(),
      locale: instance.get<AppPreference>().getAppLanguage(),
      fallbackLocale: const Locale('en','MM'),title: "CMO Ferry Application",
      debugShowCheckedModeBanner: false,
      navigatorKey: Get.key,
      theme: ThemeData(),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    );
  }
}
