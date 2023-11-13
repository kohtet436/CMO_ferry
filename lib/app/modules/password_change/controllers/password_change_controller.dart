import 'package:cmo_ferry/app/core/values/styles_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/helper/helper.dart';
import '../../../data/models/request_models/change_password_request_model.dart';
import '../../../data/repository/change_password_repository.dart';

class PasswordChangeController extends GetxController {
  TextEditingController currentController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController retypePasswordController = TextEditingController();
  final GlobalKey<FormState> key = GlobalKey<FormState>();
  FocusNode currentFocusNode = FocusNode();
  FocusNode newFocusNode = FocusNode();
  FocusNode retypeFocusNode = FocusNode();
  final RxBool _isLoading = false.obs;
  get isLoading => _isLoading.value;
  final RxString _message = ''.obs;
  get message => _message.value;
  @override
  void onInit() {
    super.onInit();
  }

  ChangePasswordRepository repository = Get.find();

  changePassword() async {
    try {
      _isLoading.value = true;
      var data = await repository.changePassword(ChangePasswordRequestModel(
          currentPassword: currentController.text,
          newPassword: newPasswordController.text));

      data.fold((data) {
        return _message.value = data;
      }, (error) {
        return Helper.console("weei${error.message}");
      });
    } finally {
      _isLoading.value = false;
      Get.dialog(AlertDialog(
        title: Text(message.toString()),
        actions: [
          ElevatedButton(
              style: newElevatedStyel,
              onPressed: () {
                newPasswordController.clear();
                currentController.clear();
                retypePasswordController.clear();
                Get.back();
                Get.back();
              },
              child: Text(
                "OK",
                style: getRegularStyle(color: Colors.white),
              ))
        ],
      ));
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
