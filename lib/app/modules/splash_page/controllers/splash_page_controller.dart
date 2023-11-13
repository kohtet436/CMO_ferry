import 'package:cmo_ferry/app/core/helper/environment.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../core/helper/app_prefs.dart';
import '../../../core/helper/di.dart';
import '../../../routes/app_pages.dart';

class SplashPageController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() async {
    final appPref = instance<AppPreference>();
    Future.delayed(const Duration(seconds: 3)).then(
      (value) => GetStorage().read('token')==null
      // appPref.getAccessToken().isEmpty
          ? Get.offAllNamed(
              Routes.LOGIN,
            )
          : Get.offAllNamed(
              Routes.NAVIGATION_PAGE,
            ),
    );
    super.onReady();
  }
}
