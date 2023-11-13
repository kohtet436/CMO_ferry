import 'package:alice/alice.dart';
import 'package:cmo_ferry/app/core/helper/environment.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:cmo_ferry/app/core/helper/constant.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../../data/remote/ems_api_service.dart';
import '../controllers/splash_page_controller.dart';

class SplashPageBinding extends Bindings {
  @override
  void dependencies() async {
    Get.put<SplashPageController>(
      SplashPageController(),
    );

  }
}
