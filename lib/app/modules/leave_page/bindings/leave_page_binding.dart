import 'package:cmo_ferry/app/data/remote/route_api_service.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../../core/helper/di.dart';
import '../../../data/remote/dio_factory.dart';
import '../../../data/remote/ems_api_service.dart';
import '../../../data/repository/ferry_leave_repository.dart';
import '../../../data/source/remote/ferry_leave_remote_data_source.dart';
import '../controllers/leave_page_controller.dart';

class LeavePageBinding extends Bindings {
  @override
  void dependencies() {
    Dio dio = DioFactory(instance()).getEmsDio();
    EmsApiService emsApiService = EmsApiService(dio);
    Get.lazyPut<LeavePageController>(
      () => LeavePageController(),
    );

    Get.lazyPut<FerryLeaveRemoteDataSource>(
      () => FerryLeaveRemoteDataSourceImpl(emsApiService,),
    );

    Get.lazyPut<FerryLeaveRepository>(
      () => FerryLeaveRepositoryImpl(remoteDataSource: Get.find()),
    );
  }
}
