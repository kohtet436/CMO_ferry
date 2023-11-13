import 'package:cmo_ferry/app/data/remote/dio_factory.dart';
import 'package:cmo_ferry/app/data/remote/ems_api_service.dart';
import 'package:cmo_ferry/app/data/remote/route_api_service.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../../core/helper/di.dart';
import '../../../data/repository/base_route_repository.dart';
import '../../../data/repository/baseroute_id_repository.dart';
import '../../../data/source/remote/base_route_remote_data_source.dart';
import '../../../data/source/remote/baseroute_id_remote_data_source.dart';
import '../controllers/log_in_page_controller.dart';
import '../../../data/repository/login_repository.dart';
import '../../../data/source/remote/login_remote_data_source.dart';

class LogInPageBinding extends Bindings {
  @override
  void dependencies() {
    Dio dio = DioFactory(instance()).getRmsDio();
    RouteApiService rmsApiService = RouteApiService(dio);
    
    Get.lazyPut<LogInPageController>(
      () => LogInPageController(),
    );

    Get.lazyPut<LogInRemoteDataSource>(
      () => LogInRemoteDataSourceImpl(
        apiService: instance<EmsApiService>(),
      ),
    );

    Get.lazyPut<LogInRepository>(
          () => LogInRepositoryImpl(
        remoteDataSource: Get.find(),
      ),
    );

    Get.lazyPut<GetBaseRouteIdRemoteDataSource>(
          () => GetBaseRouteIdRemoteDataSourceImpl(
        rmsApiService,
      ),
    );

    Get.lazyPut<GetBaseRouteIdRepository>(
          () => GetBaseRouteIdRepositoryImpl(
        remoteDataSource: Get.find(),
      ),
    );

    // Get.lazyPut<BaseRouteRemoteDataSource>(
    //       () => BaseRouteRemoteDataSourceImpl(
    //     rmsApiService,
    //   ),
    // );

    // Get.lazyPut<BaseRouteRepository>(
    //       () => BaseRouteRepositoryImpl(
    //     Get.find(),
    //   ),
    // );
  }
}
