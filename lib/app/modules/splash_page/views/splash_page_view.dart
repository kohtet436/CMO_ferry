import 'package:cmo_ferry/app/core/values/assets_manager.dart';
import 'package:cmo_ferry/app/core/values/color_manager.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/splash_page_controller.dart';

class SplashPageView extends StatelessWidget {
  final controller = Get.put(SplashPageController());

  SplashPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primaryColor,
      body: Center(
        child: SizedBox(
          width: 150,
          height: 150,
          child: Image.asset(ImageAssets.loginLogo),
        ),
      ),
    );
  }
}
