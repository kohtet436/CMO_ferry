import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../../core/helper/di.dart';
import '../../../data/remote/dio_factory.dart';
import '../../../data/remote/ems_api_service.dart';
import '../../../data/repository/change_password_repository.dart';
import '../../../data/source/remote/chang_password_remote_data_source.dart';
import '../controllers/password_change_controller.dart';

class PasswordChangePageBinding extends Bindings {
  @override
  void dependencies() {
      Dio dio = DioFactory(instance()).getEmsDio();

    Get.lazyPut<PasswordChangeController>(
      () => PasswordChangeController(),
    );
    final emsApiService = EmsApiService(dio);

  Get.lazyPut<ChangePasswordRemoteDataSource>(
      () => ChangePasswordRemoteDataSourceImpl(
        // Get.find(),
        emsApiService
      ),
    );

    Get.lazyPut<ChangePasswordRepository>(
      () => ChangePasswordRepositoryImpl(
        remoteDataSource: Get.find(),
      ),
    );



  }
}
