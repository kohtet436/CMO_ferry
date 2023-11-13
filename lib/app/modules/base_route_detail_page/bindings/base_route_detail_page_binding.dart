import 'package:cmo_ferry/app/core/helper/di.dart';
import 'package:cmo_ferry/app/data/remote/route_api_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../data/remote/dio_factory.dart';
import '../../../data/repository/base_route_repository.dart';
import '../../../data/source/remote/base_route_remote_data_source.dart';
import '../controllers/base_route_detail_page_controller.dart';

class BaseRouteDetailPageBinding extends Bindings {
  @override
  void dependencies() {
    Dio rmsDio = DioFactory(instance()).getRmsDio();
    RouteApiService rmsApiService = RouteApiService(rmsDio);
    Get.lazyPut<BaseRouteDetailPageController>(
      () => BaseRouteDetailPageController(),
    );

    Get.lazyPut<BaseRouteRemoteDataSource>(
      () => BaseRouteRemoteDataSourceImpl(rmsApiService,),
    );

    Get.lazyPut<BaseRouteRepository>(
      () => BaseRouteRepositoryImpl(Get.find()),
    );
  }
}
