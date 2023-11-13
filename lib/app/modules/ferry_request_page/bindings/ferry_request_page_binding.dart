import 'package:cmo_ferry/app/core/helper/di.dart';
import 'package:cmo_ferry/app/data/remote/ems_api_service.dart';
import 'package:cmo_ferry/app/data/repository/ferry_request_repository.dart';
import 'package:cmo_ferry/app/data/source/remote/ferry_request_remote_data_source.dart';
import 'package:get/get.dart';

import '../controllers/ferry_request_page_controller.dart';

class FerryRequestPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FerryRequestPageController>(
      () => FerryRequestPageController(),
    );

    Get.lazyPut<FerryRequestRemoteDataSource>(
      () => FerryRequestRemoteDataSourceImpl(
        emsApiService: instance<EmsApiService>(),
      ),
    );

    Get.lazyPut<FerryRequestRepository>(
          () => FerryRequestRepositoryImpl(
        remoteDataSource: Get.find(),
      ),
    );
  }
}
