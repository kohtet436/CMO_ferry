import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../data/remote/ems_api_service.dart';
import '../../data/remote/route_api_service.dart';
import '../helper/app_enum.dart';
import '../helper/environment.dart';
import '../values/strings_manager.dart';

class MethodUtil {
  static DailyRouteType stringToRouteType(String routeType) {
    final String routeTypeUpper = routeType.toUpperCase();
    switch (routeTypeUpper) {
      case "MORNING":
        return DailyRouteType.MORNING;
      case "EVENING":
        return DailyRouteType.EVENING;
      default:
        throw throw Exception('Unknown route type');
    }
  }

  static String routeTypeToString(DailyRouteType routeType) {
    switch (routeType) {
      case DailyRouteType.MORNING:
        return AppStrings.morning;
      case DailyRouteType.EVENING:
        return AppStrings.evening;
    }
  }


}
