import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../../core/helper/di.dart';
import '../../../data/remote/dio_factory.dart';
import '../../../data/remote/route_api_service.dart';
import '../../../data/repository/baseroute_id_repository.dart';
import '../../../data/repository/daily_route_respository.dart';
import '../../../data/source/remote/baseroute_id_remote_data_source.dart';
import '../../../data/source/remote/deaily_route_remote_data_source.dart';
import '../controllers/navigation_page_controller.dart';

class NavigationPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NavigationPageController>(
      () => NavigationPageController(),
    );
     Dio dio = DioFactory(instance()).getRmsDio();
    RouteApiService rmsApiService = RouteApiService(dio);
    Get.lazyPut<NavigationPageController>(
      () => NavigationPageController(),
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
