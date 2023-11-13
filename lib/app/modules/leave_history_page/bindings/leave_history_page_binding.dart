import 'package:cmo_ferry/app/data/remote/dio_factory.dart';
import 'package:cmo_ferry/app/data/remote/ems_api_service.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../../core/helper/di.dart';
import '../../../data/repository/leave_history_repository.dart';
import '../../../data/source/remote/leave_history_remote_data_source.dart';
import '../controllers/leave_history_page_controller.dart';

class LeaveHistoryPageBinding extends Bindings {
  @override
  void dependencies() {
    Dio dio = DioFactory(instance()).getEmsDio();
    EmsApiService emsApiService = EmsApiService(dio);
    Get.lazyPut<LeaveHistoryPageController>(
      () => LeaveHistoryPageController(),
    );
      Get.lazyPut<LeaveHistoryRemoteDataSource>(
      () => LeaveHistoryRemoteDataSourceImpl(apiService: emsApiService, ),
    );

    Get.lazyPut<LeaveHistoryRepository>(
      () => LeaveHistoryRepositoryImpl(remoteDataSource: Get.find()),
    );
  }
}
