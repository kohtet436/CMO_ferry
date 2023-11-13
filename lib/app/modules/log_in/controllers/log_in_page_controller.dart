import 'package:cmo_ferry/app/data/models/response_models/login_model.dart';
import 'package:cmo_ferry/app/data/remote/ems_api_service.dart';
import 'package:cmo_ferry/app/data/repository/login_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../../core/helper/app_prefs.dart';
import '../../../core/helper/di.dart';
import '../../../core/helper/helper.dart';
import '../../../core/values/strings_manager.dart';
import '../../../data/models/response_models/base_route_id_model.dart';
import '../../../data/remote/dio_factory.dart';
import '../../../core/values/color_manager.dart';
import '../../../data/repository/baseroute_id_repository.dart';
import '../../../routes/app_pages.dart';

class LogInPageController extends GetxController {
  final userIdTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  final iconColor = ColorManager.lightGrey.obs;
   final RxString? _jwtToken = null;
  get jwtToken => _jwtToken;

  final LogInRepository repository = Get.find();

  final isLoading = false.obs;

  final logInResponse = Rxn<LogInModel>();

  final errorMessage = Rxn<String>();

  final isPasswordHide = true.obs;

  var appVersion = Rx<String>("N/A");

  @override
  void onInit() {
    // userIdTextController.value = TextEditingController();
    // passwordTextController.value = TextEditingController();

    // getVersion();
    // getBaseRouteId();
    super.onInit();
  }
          final appPrefs = instance.get<AppPreference>();

  // void logIn(String userId, String password) async {
  //   try {
  //     isLoading(true);
  //     Helper.showLoadingDialog();
  //     Helper.console(isLoading.toString());
  //     final response = await repository.logIn(userId, password);
  //     response.fold(
  //       (data) {
  //         logInResponse(data);
  //         Helper.console('Raw token is ==> ${data.token}');
          // appPrefs.setAccessToken(data.token);
  //         // print(
  //         // "token${appPrefs.setAccessToken(data.token)}"

  //         // );
         
  //       },
  //       (error) {
  //         if (error.statusCode == 401) {
  //           Helper.showQuickToast(error.message);
  //         }
  //         Helper.showQuickToast(
  //           "Your password or email is incorrect. Please try again or contact admin.",
  //         );
  //       },
  //     );
  //   } finally {
  //     // isLoading(false);
  //     // Helper.hideLoadingDialog();
  //     if(dat)
  //      getBaseRouteId();
  //         Get.offAllNamed(Routes.NAVIGATION_PAGE);
  //   }
  // }
 void logIn() async {
    try {
      // _isloading.value = true;
      final response = await repository.logIn(
        // LoginRequestModel(
          // username:
          userIdTextController.text,
          // password:
          passwordTextController.text
      );
      response.fold(
        (data) {
          logInResponse.value = data;
          GetStorage().write('token',logInResponse.value?.token);
          appPrefs.setAccessToken(logInResponse.value!.token);

          // GetStorage().write('jwtToken', logInResponse.value?.token ?? "");
        },
        (error) {
          if (error.statusCode == 401) {
            errorMessage(error.message);
          }
        },
      );
    } finally {
      // isLoading = false;
      if (logInResponse.value != null) {
        // getBaseRouteId();

        Get.offAllNamed(Routes.NAVIGATION_PAGE);
      } else {
        Helper.showQuickToast(
          "Your password or employee id is incorrect.Please try again or contact admin.",
        );
      }
    }
  }
 

  void getVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    appVersion(packageInfo.version);
  }

 



  @override
  void dispose() {
    userIdTextController.dispose();
    passwordTextController.dispose();
    super.dispose();
  }
}
