import 'package:cmo_ferry/app/data/remote/ems_api_service.dart';
import 'package:cmo_ferry/app/data/repository/employee_repository.dart';
import 'package:cmo_ferry/app/data/source/remote/employee_remote_data_source.dart';
import 'package:cmo_ferry/app/data/source/remote/ferry_request_remote_data_source.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../../core/helper/di.dart';
import '../../../data/remote/dio_factory.dart';
import '../../../data/repository/ferry_request_repository.dart';
import '../controllers/other_page_controller.dart';

class OtherPageBinding extends Bindings {
  @override
  void dependencies() {

    Dio dio = DioFactory(instance()).getEmsDio();

    Get.lazyPut<OtherPageController>(
      () => OtherPageController(),
    );

    final emsApiService = EmsApiService(dio);
    Get.lazyPut<EmployeeRemoteDataSource>(
      () => EmployeeRemoteDataSourceImpl(
       apiServices: emsApiService,
      ),
    );

    Get.lazyPut<EmployeeRepository>(
      () => EmployeeRepositoryImpl(
        Get.find<EmployeeRemoteDataSource>(),
      ),
    );

    Get.lazyPut<FerryRequestRemoteDataSource>(() => FerryRequestRemoteDataSourceImpl(emsApiService: emsApiService));
    Get.lazyPut<FerryRequestRepository>(() => FerryRequestRepositoryImpl(remoteDataSource: Get.find()));
  }
}
