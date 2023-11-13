import 'package:cmo_ferry/app/core/helper/constant.dart';
import 'package:cmo_ferry/app/data/repository/base_route_repository.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../core/helper/helper.dart';
import '../../../data/models/response_models/base_routes_model.dart';

class BaseRouteDetailPageController extends GetxController {
  final RxBool _isLoading = true.obs;
  get isLoading => _isLoading.value;
  Rxn<BaseRouteModel> baseRoute = Rxn<BaseRouteModel>();
  final BaseRouteRepository repository = Get.find();
  @override
  void onInit() {
    getBaseRouteData();
    super.onInit();
  }

  void getBaseRouteData() async {
    try {
      var data =
          await repository.getBaseRouteData(GetStorage().read('baseRouteId'));
      data.fold((data) {
        return baseRoute.value = data;
      }, (error) {
        return Helper.console(error.message);
      });
    } finally {
      _isLoading.value = false;
    }
  }
}
