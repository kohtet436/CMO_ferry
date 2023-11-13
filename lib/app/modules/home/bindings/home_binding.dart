import 'package:cmo_ferry/app/data/remote/dio_factory.dart';
import 'package:cmo_ferry/app/data/remote/ems_api_service.dart';
import 'package:cmo_ferry/app/data/remote/route_api_service.dart';
import 'package:cmo_ferry/app/data/repository/baseroute_id_repository.dart';
import 'package:cmo_ferry/app/data/source/remote/base_route_remote_data_source.dart';
import 'package:cmo_ferry/app/data/source/remote/baseroute_id_remote_data_source.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../../core/helper/di.dart';
import '../../../data/repository/daily_route_respository.dart';
import '../../../data/source/remote/deaily_route_remote_data_source.dart';
import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  
  @override
  void dependencies() {
    Dio dio = DioFactory(instance()).getRmsDio();
    RouteApiService rmsApiService = RouteApiService(dio);
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
      Get.lazyPut<GetBaseRouteIdRemoteDataSource>(
          () => GetBaseRouteIdRemoteDataSourceImpl(rmsApiService),
    );

    Get.lazyPut<GetBaseRouteIdRepository>(
          () => GetBaseRouteIdRepositoryImpl(remoteDataSource: Get.find()),
    );
     Get.lazyPut<DailyRouteRemoteDataSource>(
      () => DailyRouteRemoteDataSourceImpl(rmsApiService),
    );

    Get.lazyPut<DailyRouteRepository>(
      () => DailyRouteRepositoryImpl( Get.find()),
    );
    

  
 
  }
}
